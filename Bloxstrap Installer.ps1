#############################################################################
$main = "https://api.github.com/repos/pizzaboxer/bloxstrap/releases/latest"
$release = Invoke-RestMethod -Uri $apiUrl
$download = $release.assets[0].browser_download_url
$desktop = [Environment]::GetFolderPath("Desktop")
$tools = Join-Path -Path $desktop -ChildPath "Tools"
$bloxsttrap = Join-Path -Path $tools -ChildPath "Bloxstrap"
$exepath = Join-Path -Path $bloxsttrap -ChildPath "Bloxstrap.exe"
#############################################################################
if (-not (Test-Path -Path $tools -PathType Container)) {
    New-Item -Path $tools -ItemType Directory | Out-Null
}
if (-not (Test-Path -Path $bloxsttrap -PathType Container)) {
    New-Item -Path $bloxsttrap -ItemType Directory | Out-Null
}
#############################################################################
Invoke-WebRequest -Uri $download -OutFile $exepath
Start-Process -FilePath $exepath
#############################################################################