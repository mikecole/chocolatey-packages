$ErrorActionPreference = 'Stop'
$checksum = '6c335c872092051f4104630d99f11294548b46c82b365fbb82275945dc4d548c'
$checksum64 = '4afd44dc697fafc57cbf6fc5788406dc50d26d2bdf11ea4a6d4a4fc98ebabcdf'

$url = 'https://cdn.zoom.us/prod/5.13.4.11835/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/5.13.4.11835/x64/ZoomInstallerFull.msi'

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
