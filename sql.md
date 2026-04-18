# SQL 2025


~~~code



New-SelfSignedCertificate -DnsName $env:COMPUTERNAME -CertStoreLocation "cert:\LocalMachine\My" -NotAfter (Get-Date).AddYears(60)

certlm.msc

Certificates (Local Computer)
   └ Personal
       └ Certificates
	   
Issued To = nome do servidor

All Tasks
   → Copy

Trusted Root Certification Authorities
   └ Certificates
   
New-NetFirewallRule  -DisplayName "SQL Server 1433"  -Direction Inbound  -Protocol TCP  -LocalPort 1433  -Action Allow  -Profile Domain,Private,Public



--------

$path = "HKLM:\SYSTEM\CurrentControlSet\Services\stornvme\Parameters\Device"
New-Item -Path $path -Force | Out-Null
New-ItemProperty -Path $path `
    -Name "ForcedPhysicalSectorSizeInBytes" `
    -PropertyType MultiString `
    -Value "* 4095" `
    -Force



~~~
