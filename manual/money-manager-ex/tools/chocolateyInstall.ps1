$ErrorActionPreference = 'Stop'
$packageArgs = @{
  packageName    = 'money-manager-ex'
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'exe'  
  silentArgs     = '/VERYSILENT /NORESTART'
  validExitCodes = @(0)
  softwareName   = 'MoneyManagerEX*'
  url32bit       = 'https://github.com/moneymanagerex/moneymanagerex/releases/download/v1.5.16/mmex-1.5.16-win32.exe'
  checksum32     = '773dfd75933224a4af5fbf9fd915f7acabfab9988fa11146a6690a7fe27badb2'
  checksumType32 = 'sha256'
  url64bit       = 'https://github.com/moneymanagerex/moneymanagerex/releases/download/v1.5.16/mmex-1.5.16-win64.exe'
  checksum64     = '795d9652abf1d396f703622185b9771fb317e00c4ff67185a4853752c68fa24f'
  checksumType64 = 'sha256'
}

Install-ChocolateyPackage @packageArgs
