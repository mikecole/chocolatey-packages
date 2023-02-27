$ErrorActionPreference = 'Stop'
$checksum = 'e689d8c5b7192a05a94cddc0f7d37fcac5aebb60245b2e09d36f19163f926f8c'
$checksum64 = 'a6d72df7f740c9c07293bb973818da075e19ac9de6750d2c19b19c604ccb8420'

$url = 'https://cdn.zoom.us/prod/5.13.10.13305/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/5.13.10.13305/x64/ZoomInstallerFull.msi'

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
