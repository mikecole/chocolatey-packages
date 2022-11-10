$ErrorActionPreference = 'Stop'
$checksum = '5e7f9dd4cf38c565f20bbca4fe8be038ce13690c5677cad392626cfbd01f434c'
$checksum64 = '55141f6a10a7cf9b7fde39ae254bda451467113595467d63be5961f44b918be2'

$url = 'https://cdn.zoom.us/prod/5.12.8.10232/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/5.12.8.10232/x64/ZoomInstallerFull.msi'

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
