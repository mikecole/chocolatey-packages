$ErrorActionPreference = 'Stop'
$checksum = 'e1e36a4157d8bd853663b424a7d55529044b0085875401cde53369836bdecd1a'
$checksum64 = 'e7bfdd10cecaf7a9e27e18bc4f9806c2824025c26d4835ebf37a6f7d8eda014d'

$url = 'https://cdn.zoom.us/prod/5.7.4.804/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/5.7.4.804/x64/ZoomInstallerFull.msi'

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
