$ErrorActionPreference = 'Stop'
$checksum = 'ea95bbccfadef48fc743d6fffff36b6da104cc444d38eb7847936fa172ef7470'
$checksum64 = '7c041b6dac1e84e38aafd8cc7a6f801b5883ec04d97d74b71ca98a9a7a7925b1'

$url = 'https://cdn.zoom.us/prod/5.10.6.5263/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/5.10.6.5263/x64/ZoomInstallerFull.msi'

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
