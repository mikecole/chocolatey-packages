$ErrorActionPreference = 'Stop'

$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$fileFullPath = Join-Path $toolsDir 'FlashDevelop-5.3.3.exe'

$packageArgs = @{
  packageName    = 'flashdevelop'
  fileFullPath   = $fileFullPath
  url            = 'http://www.flashdevelop.org/downloads/releases/FlashDevelop-5.3.3.exe'
  checksum       = '7B3109DD768C0C2EF285A0D4A019AB4E89D58F0229A3B820D72F363E7EE3DE38'
  checksumType   = 'sha256'
}

Get-ChocolateyWebFile @packageArgs

# AutoIt
$installerFile = Join-Path $toolsDir 'flashdevelop.au3'
write-host "Installing `'$fileFullPath`' with AutoIt3 using `'$installerFile`'"
$installArgs = "/c autoit3 `"$installerFile`" `"$fileFullPath`""
Start-ChocolateyProcessAsAdmin -Statements "$installArgs" -ExeToRun 'cmd.exe' -ValidExitCodes @(0)