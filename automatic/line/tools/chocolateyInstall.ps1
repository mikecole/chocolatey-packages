$ErrorActionPreference = 'Stop'
$checksum = 'f56f178e82d79161fc9def48ac89f15c2685b09288742761aa3e635838a07570'

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
