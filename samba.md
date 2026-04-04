
~~~code

# Define o caminho da chave de registro para configurações de LanmanWorkstation
$registryPath = "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters"
$name = "AllowInsecureGuestAuth"
$value = 1

# Verifica se a chave existe, se não, cria. Se existe, altera para 1.
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}

New-ItemProperty -Path $registryPath -Name $name -Value $value -PropertyType DWord -Force

Write-Host "Configuração aplicada: Acesso de convidado inseguro habilitado." -ForegroundColor Green
Write-Host "Tentando reiniciar o serviço de Estação de Trabalho para aplicar..." -ForegroundColor Cyan

# Reinicia o serviço necessário para aplicar a mudança sem reiniciar o Windows
Restart-Service -Name "LanmanWorkstation" -Force

Write-Host "Pronto! Tente acessar o caminho de rede novamente." -ForegroundColor Yellow

~~~~
