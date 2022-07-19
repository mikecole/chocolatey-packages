$ErrorActionPreference = 'Stop'
$checksum = 'a15308e889b29ba99955666b02a2db3fff9a5d3faa0ee777a3f465b037be7274'
$checksum64 = '685b1caf7cd1155c75260cf485ebc00c5aac4628a61bec34c54c50f4e704e252'

$url = 'https://cdn.zoom.us/prod/5.11.3.7123/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/5.11.3.7123/x64/ZoomInstallerFull.msi'

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
