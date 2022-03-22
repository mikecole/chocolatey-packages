$ErrorActionPreference = 'Stop'
$checksum = 'dc2cf9a14a828be8a713c54b6ff452f57bff0e4a81d6e167b37d7bebfdd191d5'
$checksum64 = '73ed335bb641fa3a61923c94de4862bdc4064b45f447f027b05f1d38d74a650a'

$url = 'https://cdn.zoom.us/prod/5.10.0.4306/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/5.10.0.4306/x64/ZoomInstallerFull.msi'

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
