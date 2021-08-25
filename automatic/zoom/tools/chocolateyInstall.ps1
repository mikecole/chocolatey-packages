$ErrorActionPreference = 'Stop'
$checksum = '263475d94b5ac328f29fcffd0c607d82e17517526c833c8798d76782e5cc0380'
$checksum64 = '9c20fc448e29ebbe8b05ea6e3ab42aad44189df59c9435b306b7993810ac4d85'

$url = 'https://cdn.zoom.us/prod/5.7.5.939/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/5.7.5.939/x64/ZoomInstallerFull.msi'

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
