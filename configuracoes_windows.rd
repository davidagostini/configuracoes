


# Windows


~~~code

 
 
# Desativa o Print Screen no Snipping Tool (Acessibilidade)
$regPath = "HKCU:\Software\Microsoft\Ease of Access\Keyboard"
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}
Set-ItemProperty -Path $regPath -Name "PrintScreenKeyForSnippingEnabled" -Type DWord -Value 0

Write-Host "✅ Tecla Print Screen desvinculada da ferramenta de recorte (Acessibilidade)."
~~~
