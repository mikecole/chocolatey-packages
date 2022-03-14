$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = 'ringcentral-classic'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'exe'  
  silentArgs     = '/VERYSILENT'
  validExitCodes = @(0)
  softwareName   = 'RingCentral Classic*'
  url64bit       = 'https://app.ringcentral.com/download/RingCentral.exe?V=2012528645154747305'
  checksum64     = '7fc743e1adfa8b795a9d731239b005d47437cd6e55267df482ef28424ebec765'
  checksumType64 = 'sha256'
}

Install-ChocolateyPackage @packageArgs
