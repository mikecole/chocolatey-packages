$ErrorActionPreference = 'Stop'

$checksum = '302b9a24938561acf81d090e92e6fb75cfec034a9b91e153d2d63385a5044823'
$url = 'http://www.resplendence.com/download/whocrashedSetup.exe'

$packageArgs = @{
  packageName   = 'whocrashed'
  unzipLocation = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType      = 'exe'
  url           = $url
  silentArgs    = '/VERYSILENT /NORESTART'
  validExitCodes= @(0, 3010, 1641)
  softwareName  = 'WhoCrashed*'
  checksum      = $checksum
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs