# Instalar Choco e Programas


~~~code




 
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))


choco upgrade all -y
choco install choco-upgrade-all-at-startup -y


choco install urlrewrite -y
choco install sql-server-2022 -y
choco install sql-server-management-studio -y
choco install dbeaver -y
choco install googlechrome -y  --ignore-checksums
choco install firefox -y
choco install firefox-dev --pre  -y
choco install postman -y
choco install insomnia-rest-api-client -y
choco install soapui -y
choco install notepadplusplus -y
choco install 7zip.install -y
choco install greenshot -y
choco install teamviewer -y
choco install forticlientvpn -y
choco install microsoftazurestorageexplorer -y
choco install azcopy10 -y
choco install ditto -y
choco install maven -y
choco install obs-studio -y
choco install git -y
choco install screentogif -y
choco install microsoft-openjdk-21 -y
choco install docker-desktop -y
choco install winscp -y
choco install netbird -y
choco install s3browser -y
choco install cloudflared -y
choco install visualstudio2022community -y
choco install androidstudio -y
choco install office365business


~~~
