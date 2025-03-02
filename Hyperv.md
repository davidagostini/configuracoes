Windows 11

Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V-All


Windows Server

Install-WindowsFeature -Name Hyper-V -IncludeManagementTools -Restart
