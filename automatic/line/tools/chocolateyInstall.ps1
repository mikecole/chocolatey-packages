$ErrorActionPreference = 'Stop'
$checksum = 'fd571c23d60d8cea57aa151509937313399f376e991f467ba2901d7ce9393da0'

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
