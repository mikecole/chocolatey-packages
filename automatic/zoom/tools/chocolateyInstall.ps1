$ErrorActionPreference = 'Stop'
$checksum = '29dad30b1707f1e76c3b54af22c5f1f0c61e8bec65858683ebe6e5f28117a0f9'
$checksum64 = '84f477f96a4932832c1874a778485aa615bd668bf016614902b80a2e80650be2'

$url = 'https://cdn.zoom.us/prod/5.12.3.9638/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/5.12.3.9638/x64/ZoomInstallerFull.msi'

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
