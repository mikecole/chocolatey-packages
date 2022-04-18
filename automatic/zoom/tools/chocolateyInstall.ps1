$ErrorActionPreference = 'Stop'
$checksum = '3c8e54f2034a5263587d95d2cfe150aa4379c3e5349f012928d510cb63b3eea7'
$checksum64 = 'd22d88647fad29125f77e7d3390cd86cb9ebe193f0454bd16c1b0b778d5b773f'

$url = 'https://cdn.zoom.us/prod/5.10.3.4851/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/5.10.3.4851/x64/ZoomInstallerFull.msi'

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
