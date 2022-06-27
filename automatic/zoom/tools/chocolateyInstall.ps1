$ErrorActionPreference = 'Stop'
$checksum = '065856089bf50fddfc72cc8dbbe442f7a4dd004f10c9a4729a0741d42a283622'
$checksum64 = 'a392b980dbb80603d84342bf20538a311761429cd43eb7b86f2a606369a887fe'

$url = 'https://cdn.zoom.us/prod/5.11.1.6602/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/5.11.1.6602/x64/ZoomInstallerFull.msi'

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
