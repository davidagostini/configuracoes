
# Exclusões do Windows Defender


~~~code

Add-MpPreference -ExclusionProcess "genexus.exe"

Add-MpPreference -ExclusionProcess "msbuild.exe"

Add-MpPreference -ExclusionProcess "dotnet.exe"

Add-MpPreference -ExclusionPath "C:\modelos"

Add-MpPreference -ExclusionProcess "C:\Windows\System32\inetsrv\w3wp.exe"

Add-MpPreference -ExclusionPath "C:\Windows\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files"
Add-MpPreference -ExclusionPath "C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files"

~~~


