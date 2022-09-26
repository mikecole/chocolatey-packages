$ErrorActionPreference = 'Stop'
$checksum = '43c5f511fc37bb5500c54d466ae46d4570ce8d8d2d137d6847b6b7c479b9e591'
$checksum64 = '889162d15f566dba94e58cf11847d0d8bc26e01141497473e1c41f1ec68df87e'

$url = 'https://cdn.zoom.us/prod/5.12.0.8964/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/5.12.0.8964/x64/ZoomInstallerFull.msi'

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
