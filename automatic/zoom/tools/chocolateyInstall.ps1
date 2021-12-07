$ErrorActionPreference = 'Stop'
$checksum = '84c8b69e051ab3cc3b340f53a6bd4b505ad9323687c6dc122b2b49c62b9248e5'
$checksum64 = '46cab88121c11211f9f957b429625de057c4a8c5456a9a97117e86f1124dd0c0'

$url = 'https://cdn.zoom.us/prod/5.8.7.2058/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/5.8.7.2058/x64/ZoomInstallerFull.msi'

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
