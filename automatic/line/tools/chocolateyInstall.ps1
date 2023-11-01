$ErrorActionPreference = 'Stop'
$checksum = 'b3fad4d8f8bf27067b324daee0de01db8faa13a80dbce7c6b8973e204e315f0e'

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
