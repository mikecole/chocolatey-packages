$ErrorActionPreference = 'Stop'
$checksum = 'e4bf2b0cbaad23bf0583471685870c809a23db8c6ea987e8a84088c08bbbd6c3'
$checksum64 = 'b5edfac66939e2ca1b2bffdfc219c886c45175cbb79bc590247f7300085f67c6'

$url = 'https://cdn.zoom.us/prod/5.11.10.8200/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/5.11.10.8200/x64/ZoomInstallerFull.msi'

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
