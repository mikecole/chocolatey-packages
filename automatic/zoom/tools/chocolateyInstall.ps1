$ErrorActionPreference = 'Stop'
$checksum = '8045efecffa6b7f859f290223c483fc705228960dda7808eae4b28932a1a265f'
$checksum64 = '7bb3e1984de73120e3335ce1c533a180e08c42c6113dae85b00cc2a04186c6c5'

$url = 'https://cdn.zoom.us/prod/5.14.6.15434/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/5.14.6.15434/x64/ZoomInstallerFull.msi'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
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
