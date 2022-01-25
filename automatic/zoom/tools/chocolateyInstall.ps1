$ErrorActionPreference = 'Stop'
$checksum = '04c4d3eaa4f340bdd9e4e15a555ae0fc6053ac2f678e362f5e7d53fd358a77a6'
$checksum64 = '886a4488f7611bd75caa5909f985afa6043af48e1c8a54c915a4206d563ba18e'

$url = 'https://cdn.zoom.us/prod/5.9.3.3169/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/5.9.3.3169/x64/ZoomInstallerFull.msi'

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
