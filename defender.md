
# Exclusões do Windows Defender


~~~code

Add-MpPreference -ExclusionProcess "genexus.exe"

Add-MpPreference -ExclusionProcess "msbuild.exe"

Add-MpPreference -ExclusionProcess "dotnet.exe"

Add-MpPreference -ExclusionPath "C:\modelos"


~~~
