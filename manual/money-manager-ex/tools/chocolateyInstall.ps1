$ErrorActionPreference = 'Stop'
$packageArgs = @{
  packageName    = 'money-manager-ex'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'exe'  
  silentArgs     = '/VERYSILENT /NORESTART'
  validExitCodes = @(0)
  softwareName   = 'MoneyManagerEX*'
  url32bit       = 'https://github.com/moneymanagerex/moneymanagerex/releases/download/v1.3.6/mmex-1.3.6-win32.exe'
  checksum32     = 'E7B5F133DE6A2D1FDC4150D41954980FF27DA817E68F7358EF37BC73DA2AC8C3'
  checksumType32 = 'sha256'
  url64bit       = 'https://github.com/moneymanagerex/moneymanagerex/releases/download/v1.3.6/mmex-1.3.6-win64.exe'
  checksum64     = '25118A25F3CC7982CE8326F3FEFF73A909BE50C8AC85CDF1BE04756E820121E6'
  checksumType64 = 'sha256'
}

Install-ChocolateyPackage @packageArgs
