$ErrorActionPreference = 'Stop'
$checksum = '8ddf8cc519d4aa1f27a586dcfd52c5a3e425a3fb90e812543844576db6aee4ef'
$checksum64 = '1e3e7016824a01d119f03d99f4759a413d7aa3406ea671bf394cff05f2710afe'

$url = 'https://cdn.zoom.us/prod/5.10.7.6120/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/5.10.7.6120/x64/ZoomInstallerFull.msi'

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
