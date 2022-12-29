$ErrorActionPreference = 'Stop'
$checksum = '36b7bc22c4bab7063f230eb4cb4390f0c691de840632e3991cd94ae070f529e0'
$checksum64 = 'b6e29e1672b18699fd7d38e21160fdf55f1ebfa6c04f36c5d6e35493fdfca6eb'

$url = 'https://cdn.zoom.us/prod/5.13.3.11494/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/5.13.3.11494/x64/ZoomInstallerFull.msi'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
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
