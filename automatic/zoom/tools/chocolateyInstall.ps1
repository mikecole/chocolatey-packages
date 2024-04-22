$ErrorActionPreference = 'Stop'
$checksum = '203e414604b89a1e2ee604a88fe0971714960eefcc348c51d1af908c91de3459'
$checksum64 = '421fe886ebe308ffe0c9ff6a671d98b7f885ab7ac10daff7ad20abc81dc627ec'

$url = 'https://zoom.us/client/6.0.3.37634/ZoomInstallerFull.exe'
$url64 = 'https://zoom.us/client/6.0.3.37634/ZoomInstallerFull.exe?archType=x64'

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
