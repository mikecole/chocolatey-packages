$ErrorActionPreference = 'Stop'
$checksum = '1c814816863c6c2a59ee35bb3da0b15c7ffd44f567aa6fa81f7e7c33311e7148'
$checksum64 = 'a79d4564b5c54471d6efc6824859030860ef8780cfcb4eb25175648d4e9f436e'

$url = 'https://cdn.zoom.us/prod/5.14.0.13888/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/5.14.0.13888/x64/ZoomInstallerFull.msi'

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
