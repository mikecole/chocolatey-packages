$ErrorActionPreference = 'Stop'
$checksum = '28a9d80383ee50dbb1e09ba607540bca0bd92dfea8dd8941768df911b0ed753c'

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
