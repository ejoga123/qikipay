# PowerShell script to download Nuget.exe and add it to PATH for current session

$nugetUrl = "https://dist.nuget.org/win-x86-commandline/latest/nuget.exe"
$nugetPath = "$env:USERPROFILE\\nuget"

if (-Not (Test-Path $nugetPath)) {
    New-Item -ItemType Directory -Path $nugetPath | Out-Null
}

$nugetExe = Join-Path $nugetPath "nuget.exe"

Write-Host "Downloading Nuget.exe to $nugetExe ..."
Invoke-WebRequest -Uri $nugetUrl -OutFile $nugetExe

Write-Host "Adding $nugetPath to PATH for current session ..."
$env:PATH = "$nugetPath;$env:PATH"

Write-Host "Nuget.exe downloaded and PATH updated. You can now run flutter build again."
