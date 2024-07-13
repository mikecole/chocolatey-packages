$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = 'ringcentral-classic'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'exe'  
  silentArgs     = '/VERYSILENT'
  validExitCodes = @(0)
  softwareName   = 'RingCentral Classic*'
  url64bit       = 'https://app.ringcentral.com/download/RingCentral.exe?V=2012528645154747305'
  checksum64     = '8f3bfef3cfca5bb84be6f00327bca29abe35b00f7de3bf230be3109922e8fb4f'
  checksumType64 = 'sha256'
}

Install-ChocolateyPackage @packageArgs
