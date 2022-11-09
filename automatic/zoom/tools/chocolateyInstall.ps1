$ErrorActionPreference = 'Stop'
$checksum = '972568efe7c465a5c73e2aa084a60a4a2252dd0ca5fdb4e6e08db39c60231faf'
$checksum64 = '91bf1db9c02e15bf2f22199b5196c8fa68636524ea734e4a1ba2eb5fd4b4e35f'

$url = 'https://cdn.zoom.us/prod/5.12.7.10196/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/5.12.7.10196/x64/ZoomInstallerFull.msi'

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
