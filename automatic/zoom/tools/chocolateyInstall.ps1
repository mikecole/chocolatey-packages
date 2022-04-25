$ErrorActionPreference = 'Stop'
$checksum = 'cf19ce561bada35be1c444519b910bb8856d5f56de99761b19dc8ee969c9cbf5'
$checksum64 = 'f42231fc35d9fee577f7c08e7adad46b195bbc3cda61db2962b3246102a9dfae'

$url = 'https://cdn.zoom.us/prod/5.10.4.5035/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/5.10.4.5035/x64/ZoomInstallerFull.msi'

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
