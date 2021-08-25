$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = 'ringcentral-classic'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'exe'  
  silentArgs     = '/VERYSILENT'
  validExitCodes = @(0)
  softwareName   = 'RingCentral Classic*'
  url32bit       = 'http://downloads.ringcentral.com/glip/rc/20.2.21/ia32/RingCentral%20Classic-20.2.21-ia32.exe'
  checksum32     = 'CB39A93232B7FA0FA6939E07FE522EA7A0902601AA0223634E6F968D5EA2BFA8'
  checksumType32 = 'sha256'
  url64bit       = 'http://downloads.ringcentral.com/glip/rc/20.2.21/x64/RingCentral%20Classic-20.2.21-x64.exe'
  checksum64     = '4BD0DDE3805ACE781D70D69C306D288F27C143954364EFB57E2BC934BE9A15E6'
  checksumType64 = 'sha256'
}

Install-ChocolateyPackage @packageArgs
