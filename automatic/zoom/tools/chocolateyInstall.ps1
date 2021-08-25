$ErrorActionPreference = 'Stop'
$checksum = 'a5156e3d5b14fd449654a64cda2b02a38f5bacdfaa22e06fe1c1a248fbe78faa'
$checksum64 = '8b0bf9fc13934bfabcd30ba0f1d6005988084c8312f7c25bdf5bceb903cb5c56'

$url = 'https://cdn.zoom.us/prod/5.7.6.1055/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/5.7.6.1055/x64/ZoomInstallerFull.msi'

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
