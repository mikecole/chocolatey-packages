$ErrorActionPreference = 'Stop'
$checksum = '168f22340ad29af07cfffc5472432c4f90285e80d8e9f2dfae3d22ced2936e49'
$checksum64 = '2d3e3a34d8bc23f207fe50dc71704b5116146dc2595f40152ba6800dbc70b2fa'

$url = 'https://cdn.zoom.us/prod/5.13.7.12602/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/5.13.7.12602/x64/ZoomInstallerFull.msi'

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
