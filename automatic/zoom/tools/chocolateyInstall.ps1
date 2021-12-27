$ErrorActionPreference = 'Stop'
$checksum = '025cb41d33a156b2421bd689e6981552a4a8832cc31a53d1cd40e52e08181a51'
$checksum64 = '269602fb6afc3ef698a1c301663c5469855802bf7abcd6ae09ec9b7656e92e43'

$url = 'https://cdn.zoom.us/prod/5.9.1.2581/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/5.9.1.2581/x64/ZoomInstallerFull.msi'

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
