# Defina as variáveis para instalação no drive D:
$env:ChocolateyInstall="D:\Chocolatey"
[System.Environment]::SetEnvironmentVariable("ChocolateyInstall", "D:\Chocolatey", "Machine")

$env:ChocolateyToolsLocation="D:\ChocolateyTools"
[System.Environment]::SetEnvironmentVariable("ChocolateyToolsLocation", "D:\ChocolateyTools", "Machine")



Set-ExecutionPolicy Bypass -Scope Process -Force; `
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; `
Invoke-Expression "& { $(Invoke-WebRequest -UseBasicParsing https://chocolatey.org/install.ps1) }"


choco -v
