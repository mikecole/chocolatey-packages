$ErrorActionPreference = 'Stop'
$checksum = '3b616cb0beaacffb53884b5ba0453312d2577db598d2a877a3b251125fb281a1'

Start-CheckandStop "Steam"

$packageArgs = @{
  packageName   = 'steam-client'
  unzipLocation = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType      = 'exe'
  url           = 'http://media.steampowered.com/client/installer/SteamSetup.exe'
  silentArgs    = '/S'
  validExitCodes= @(0)
  softwareName  = 'steam*'
  checksum      = $checksum
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs

if ($ProcessWasRunning -eq "True") {&$ProcessFullPath}
