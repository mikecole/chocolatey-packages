$ErrorActionPreference = 'Stop'
$checksum = 'a1259b43fc10816f8b15a402e18da21e4a3e9de5ef5afcf2d590507f79009e9b'
$checksum64 = '716d3646db6f040779eb38e2df41987e53818a4ab7fb72a6af143fe385960173'

$url = 'https://cdn.zoom.us/prod/5.8.6.2048/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/5.8.6.2048/x64/ZoomInstallerFull.msi'

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
