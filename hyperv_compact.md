# =========================
# Compactar VHD/VHDX de TODAS as VMs (Hyper-V)
# =========================

$TimeoutMinutes = 5
$StartBackIfWasRunning = $true
$OptimizeMode = "Full"   # Full ou Quick

Import-Module Hyper-V -ErrorAction Stop

$log = Join-Path $env:TEMP ("HyperV-CompactAll-" + (Get-Date -Format "yyyyMMdd-HHmmss") + ".log")
Start-Transcript -Path $log | Out-Null

Write-Host "Iniciando compactação de VHD/VHDX de todas as VMs..."
Write-Host "Log: $log"
Write-Host ""

$vms = Get-VM | Sort-Object Name

foreach ($vm in $vms) {
    Write-Host "========================================"
    Write-Host "VM: $($vm.Name) | Estado atual: $($vm.State)"

    $wasRunning = ($vm.State -eq 'Running')

    if ($vm.State -eq 'Saved') {
        Write-Warning "VM está em estado SAVED. Script vai PULAR esta VM para não perder o estado salvo."
        continue
    }

    if ($vm.State -ne 'Off') {
        Write-Host "Solicitando desligamento graceful..."
        try {
            Stop-VM -Name $vm.Name -ErrorAction Stop
        } catch {
            Write-Warning "Falhou o graceful Stop-VM: $($_.Exception.Message)"
        }

        $timeout = (Get-Date).AddMinutes($TimeoutMinutes)
        do {
            Start-Sleep -Seconds 5
            $stateNow = (Get-VM -Name $vm.Name).State
            Write-Host "Aguardando... Estado: $stateNow"
        } while ($stateNow -ne 'Off' -and (Get-Date) -lt $timeout)

        $stateNow = (Get-VM -Name $vm.Name).State
        if ($stateNow -ne 'Off') {
            Write-Warning "Timeout. Fazendo TurnOff (desliga na marra)!"
            Stop-VM -Name $vm.Name -TurnOff
        }
    }

    $stateNow = (Get-VM -Name $vm.Name).State
    if ($stateNow -ne 'Off') {
        Write-Warning "VM não está Off (Estado atual: $stateNow). Pulando compactação."
        continue
    }

    $diskPaths = Get-VMHardDiskDrive -VMName $vm.Name |
        Select-Object -ExpandProperty Path -Unique |
        Where-Object { $_ -and (Test-Path $_) }

    if (-not $diskPaths -or $diskPaths.Count -eq 0) {
        Write-Host "Nenhum VHD/VHDX anexado encontrado. Pulando."
        continue
    }

    $hasAvhdx = $diskPaths | Where-Object { $_.ToLower().EndsWith(".avhdx") }
    if ($hasAvhdx) {
        Write-Warning "Encontrado AVHDX (checkpoint). Recomendo mesclar checkpoints antes. Pulando esta VM."
        continue
    }

    foreach ($vhd in $diskPaths) {
        Write-Host "Otimizar/compactar: $vhd"
        try {
            Optimize-VHD -Path $vhd -Mode $OptimizeMode -ErrorAction Stop
            Write-Host "OK: $vhd"
        } catch {
            # ✅ correção aqui: usar $($vhd) ou ${vhd}
            Write-Warning "Falha ao otimizar $($vhd): $($_.Exception.Message)"
        }
    }

    if ($StartBackIfWasRunning -and $wasRunning) {
        Write-Host "Ligando a VM de volta (ela estava rodando)..."
        try {
            Start-VM -Name $vm.Name -ErrorAction Stop
        } catch {
            Write-Warning "Falha ao iniciar VM $($vm.Name): $($_.Exception.Message)"
        }
    } else {
        Write-Host "VM ficará desligada (não estava rodando antes)."
    }
}

Write-Host ""
Write-Host "Finalizado. Log em: $log"
Stop-Transcript | Out-Null
