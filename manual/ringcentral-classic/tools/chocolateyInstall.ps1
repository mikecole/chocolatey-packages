$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = 'ringcentral-classic'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'exe'  
  silentArgs     = '/VERYSILENT'
  validExitCodes = @(0)
  softwareName   = 'RingCentral Classic*'
  url64bit       = 'https://app.ringcentral.com/download/RingCentral.exe?V=2012528645154747305'
  checksum64     = '4b00b6b3845daa146315100a0645340862d8537e756ca701364086fc675474b6'
  checksumType64 = 'sha256'
}

Install-ChocolateyPackage @packageArgs
