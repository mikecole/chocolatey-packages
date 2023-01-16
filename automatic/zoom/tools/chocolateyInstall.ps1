$ErrorActionPreference = 'Stop'
$checksum = '477758fee66874c35d9c833d2357540b41d8529daa33a37b93137f8ee1e6010e'
$checksum64 = '814b4f902d967be440b3ca99b146a3883b85e649327e4dc2855a82b1b4e96ff1'

$url = 'https://cdn.zoom.us/prod/5.13.5.12053/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/5.13.5.12053/x64/ZoomInstallerFull.msi'

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
