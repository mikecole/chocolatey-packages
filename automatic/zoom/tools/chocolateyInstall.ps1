$ErrorActionPreference = 'Stop'
$checksum = '4d88b6d950f41b6316b4d57fdeab4aef619dd2988bc9e54e7b103d7790516cbe'
$checksum64 = '9972c3cf85cd8f60215272f0e544a583b43bcd797292aca3139f7c10ad495e6c'

$url = 'https://cdn.zoom.us/prod/5.11.11.8425/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/5.11.11.8425/x64/ZoomInstallerFull.msi'

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
