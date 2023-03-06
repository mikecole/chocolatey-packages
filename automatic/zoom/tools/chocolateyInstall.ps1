$ErrorActionPreference = 'Stop'
$checksum = 'fc5d1e5f9b7ee246a7767cebd3ed01e1d22ca13d8a5672cb4c3e0e55d8f25241'
$checksum64 = 'a8d9bd84c953123212210309258229012b0861f3ab134ced8771801db8579ff6'

$url = 'https://cdn.zoom.us/prod/5.13.11.13434/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/5.13.11.13434/x64/ZoomInstallerFull.msi'

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
