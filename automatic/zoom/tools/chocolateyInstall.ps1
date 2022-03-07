$ErrorActionPreference = 'Stop'
$checksum = '9841f6dd168c80df00579767f7149580ae5029d0b46540058b2ac123207265b1'
$checksum64 = '166ff8c1e5a58c0343f9e979e390f25a23a4b743690b4500ab60dc52844dfe93'

$url = 'https://cdn.zoom.us/prod/5.9.7.3931/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/5.9.7.3931/x64/ZoomInstallerFull.msi'

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
