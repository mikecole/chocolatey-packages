$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = 'ringcentral-classic'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'exe'  
  silentArgs     = '/VERYSILENT'
  validExitCodes = @(0)
  softwareName   = 'RingCentral Classic*'
  url64bit       = 'https://app.ringcentral.com/download/RingCentral.exe?V=2012528645154747305'
  checksum64     = '7920cd0a4bfd172e0f460e4e22a9116fdf7789a4bca3ca07b99a669e3a4cd832'
  checksumType64 = 'sha256'
}

Install-ChocolateyPackage @packageArgs
