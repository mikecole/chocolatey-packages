$ErrorActionPreference = 'Stop'
$checksum = '33f90752137ec9bb98572122238e19e52db0099095a5a036d054993019a33983'
$checksum64 = '04cc59a9dc6b6b6975a4a7d717d67023cc3bfa3732cabf87610577d200095724'

$url = 'https://cdn.zoom.us/prod/5.8.4.1736/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/5.8.4.1736/x64/ZoomInstallerFull.msi'

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
