$ErrorActionPreference = 'Stop'
$checksum = '76084f9ccbe5f00f847a1cb9391459a85d893e1bf914412b5fbb78b115ac4fe8'
$checksum64 = 'fac1e6509929f4f4d8f61b0b6f9ff6f0082e5904ace02638b7666f42417d3483'

$url = 'https://cdn.zoom.us/prod/5.10.1.4420/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/5.10.1.4420/x64/ZoomInstallerFull.msi'

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
