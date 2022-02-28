$ErrorActionPreference = 'Stop'
$checksum = '88252331bdd664cd948f67ed3dbe3aefef1419377df9784a48b99a93e058682c'
$checksum64 = 'a953436ca1a92384ae2da99db20d0d5959724865e713745cc9e51f207a43e87f'

$url = 'https://cdn.zoom.us/prod/5.9.6.3799/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/5.9.6.3799/x64/ZoomInstallerFull.msi'

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
