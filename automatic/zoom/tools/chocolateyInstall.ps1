$ErrorActionPreference = 'Stop'
$checksum = '08fbfe069dbcec18d9ed4aa11c426e68ecd67957026f2da0c75858130be01a7e'
$checksum64 = '507dab1d7e5a9127db8119013989879db6297593b135d9df436027c98de371a4'

$url = 'https://cdn.zoom.us/prod/5.9.0.2481/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/5.9.0.2481/x64/ZoomInstallerFull.msi'

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
