$ErrorActionPreference = 'Stop'
$checksum = '93aea070bdcc8f0969328fb6e0707615ea5d4f098df1c49ee90517a5d3607cd5'
$checksum64 = '3c5765f01836a9491b504c259bc6751a1704f545d0e644cb29c36af7bb9ba2cd'

$url = 'https://cdn.zoom.us/prod/5.14.5.15287/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/5.14.5.15287/x64/ZoomInstallerFull.msi'

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
