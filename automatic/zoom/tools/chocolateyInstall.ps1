$ErrorActionPreference = 'Stop'
$checksum = '987c718db0572f148babedcf8cc3dac0e32ee2c2790e74e16d244607ca40581d'
$checksum64 = '6bc6ee077b48231f4f34d359d78078156388bc8ad5c2fa5afb20bafc67a48b61'

$url = 'https://zoom.us/client/5.11.9.8040/ZoomInstallerFull.msi'
$url64 = 'https://zoom.us/client/5.11.9.8040/ZoomInstallerFull.msi?archType=x64'

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
