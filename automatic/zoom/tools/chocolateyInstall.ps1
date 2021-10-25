$ErrorActionPreference = 'Stop'
$checksum = 'ea98fa5300b6a93f8f8245650184b3dbc3a443fb64c82adae85fbd08e67f894e'
$checksum64 = '86692357475c3a912dde30aa2a726d53db5b0e732cdeb8f406a936b6364aa956'

$url = 'https://cdn.zoom.us/prod/5.8.3.1581/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/5.8.3.1581/x64/ZoomInstallerFull.msi'

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
