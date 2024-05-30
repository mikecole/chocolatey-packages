$ErrorActionPreference = 'Stop'
$checksum = 'f1ea380095dfa67cc39d4ee8102c6b5eccd3d7228ff2e277aec4de1214d7f22a'

$packageArgs = @{
  packageName    = 'line'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'exe'
  url            = 'https://desktop.line-scdn.net/win/new/LineInst.exe'
  silentArgs     = '/S'
  validExitCodes = @(0)
  softwareName   = 'Line*'
  checksum       = $checksum
  checksumType   = 'sha256'
}

Install-ChocolateyPackage @packageArgs
