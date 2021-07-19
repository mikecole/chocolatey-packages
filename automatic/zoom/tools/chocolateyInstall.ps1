$ErrorActionPreference = 'Stop'
$checksum = '138d2c20679e22c7e6e5c7469b4a904bb72d4f4cf8be90e327fd8eab47401a01'
$checksum64 = 'b6579e970dd685bfb5407d3fc284938271d2e035bd1a445cf420bcf98710db01'

$url = 'https://cdn.zoom.us/prod/5.7.3.745/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/5.7.3.745/x64/ZoomInstallerFull.msi'

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
