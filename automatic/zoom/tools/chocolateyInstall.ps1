$ErrorActionPreference = 'Stop'
$checksum = 'a3fd7b2c4cec44c8672cd5351512584a9ed5ba57c0a652463304c648ce8cb341'
$checksum64 = '7c66cbeed748fb876dd387009ee9a4f5f74ed2edf9ed8696bf8410a3d8f5be1f'

$url = 'https://cdn.zoom.us/prod/5.12.6.10137/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/5.12.6.10137/x64/ZoomInstallerFull.msi'

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
