$ErrorActionPreference = 'Stop'
$checksum = '8a819a9cd62c73d8b700281b792ced227bd1c14208067ce3c36bd88c2ea28529'
$checksum64 = '8e7a2ca860ebcb9563a5903026a40a016b548b9b517044dbeb5f3cfc2c1640f8'

$url = 'https://cdn.zoom.us/prod/5.7.7.1105/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/5.7.7.1105/x64/ZoomInstallerFull.msi'

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
