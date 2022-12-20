$ErrorActionPreference = 'Stop'
$checksum = '5154f2ab061b3d2f1bbe1dd14d755adc619cc6be85ca9bfc17b9686f13f83b04'
$checksum64 = '4e3d46e6014e7e50abc5c89f67e3846d1cb132ed039912e462288b2cd305223d'

$url = 'https://cdn.zoom.us/prod/5.13.0.11216/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/5.13.0.11216/x64/ZoomInstallerFull.msi'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
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
