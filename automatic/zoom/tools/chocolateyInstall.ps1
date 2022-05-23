$ErrorActionPreference = 'Stop'
$checksum = '2a9d9b51efa33a00bcfdb7277911146e27bfab5f8483f67c5b568e0805db4b4b'
$checksum64 = 'd1f54297de90e90542a1e4b1bba4ad07d00ddf5b78366a26d8e529743010da73'

$url = 'https://cdn.zoom.us/prod/5.10.6.5889/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/5.10.6.5889/x64/ZoomInstallerFull.msi'

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
