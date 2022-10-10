$ErrorActionPreference = 'Stop'
$checksum = '1bf051d4da383a03951787029fa300110c22c02baab5115ebc9b80ca78f4c456'
$checksum64 = '632191066cc908431c61f24b5ed241d53d86937ef3ef4e0a0619b7f7adf629d8'

$url = 'https://cdn.zoom.us/prod/5.12.2.9281/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/5.12.2.9281/x64/ZoomInstallerFull.msi'

$packageArgs = @{
  packageName    = 'zoom-client'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = $url
  url64          = $url64
  silentArgs     = '/quiet /norestart ZoomAutoUpdate=True'
  validExitCodes = @(0)
  softwareName   = 'zoom*'
  checksum       = $checksum
  checksum64     = $checksum64
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
}

Install-ChocolateyPackage @packageArgs
