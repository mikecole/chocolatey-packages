$ErrorActionPreference = 'Stop'
$checksum = '839c1a8a906bd0bce47262a904708ed58eb832a1acae917ecd758ab5a01f3234'
$checksum64 = '875f149dfe13ccb6a849e9313c217abb887ad5478ef4ab281995a45fc7023710'

$url = 'https://cdn.zoom.us/prod/5.12.9.10650/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/5.12.9.10650/x64/ZoomInstallerFull.msi'

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
