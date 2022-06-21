$ErrorActionPreference = 'Stop'
$checksum = '116a62610f956e4dd4c5c5aa767048adbcb1d99eadf923aeff2792dd73f9396a'
$checksum64 = '800bd51fa8ab3bd494710361df33a89c79bec1b920986ab20f1ca8534b079fa4'

$url = 'https://cdn.zoom.us/prod/5.11.0.6569/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/5.11.0.6569/x64/ZoomInstallerFull.msi'

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
