$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = 'ringcentral-classic'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'exe'  
  silentArgs     = '/VERYSILENT'
  validExitCodes = @(0)
  softwareName   = 'RingCentral Classic*'
  url64bit       = 'https://app.ringcentral.com/download/RingCentral.exe?V=2012528645154747305'
  checksum64     = 'c76272c0f807e19917323a235b2a4a1337ecfa6c9a1ff344b6203b5a2357f91f'
  checksumType64 = 'sha256'
}

Install-ChocolateyPackage @packageArgs
