$checksum = '54bd5f5cbc290e1bab51042f620eeb5fa94089061ab17d0ae10a311335e48fb4'
$url = 'https://downloads.plex.tv/plex-media-server-new/1.25.3.5385-f05b712b6/windows/PlexMediaServer-1.25.3.5385-f05b712b6-x86.exe'

Start-CheckandStop "Plex Media Server"

$packageArgs = @{
  packageName   = 'plexmediaserver'
  unzipLocation = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType      = 'exe'
  url           = $url
  silentArgs    = '/quiet'
  validExitCodes= @(0)
  softwareName  = 'plexmediaserver*'
  checksum      = $checksum
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs

if ($ProcessWasRunning -eq "True") {&$ProcessFullPath}
