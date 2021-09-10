$ErrorActionPreference = 'Stop'
$checksum = 'ebf2b87474f4c0fd496869ecbb61e95b02df0de5dc9773e595f826d77bcec4e5'
$checksum64 = '8eac221c6f8ee4bfc898507b1c99a12d62626c1cfebc55aea8cb42a89c257fa1'

$url = 'https://cdn.zoom.us/prod/5.7.8.1247/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/5.7.8.1247/x64/ZoomInstallerFull.msi'

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
