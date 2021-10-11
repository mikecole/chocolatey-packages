$ErrorActionPreference = 'Stop'
$checksum = '37808eb0030408e448a1967e0ce98f51094c54b344ed83b6d99a394a7c6c0857'
$checksum64 = 'b369a81c0127819e6ce82bba49f294fe01d646449263773bf5015c8298d09f69'

$url = 'https://cdn.zoom.us/prod/5.8.1.1435/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/5.8.1.1435/x64/ZoomInstallerFull.msi'

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
