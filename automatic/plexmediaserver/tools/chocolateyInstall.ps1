$checksum = 'b85e2cc91662fca8b2cc9a5ee781e5445b92551c1a83998b620eccba6b85a520'
$url = 'https://downloads.plex.tv/plex-media-server-new/1.24.1.4931-1a38e63c6/windows/PlexMediaServer-1.24.1.4931-1a38e63c6-x86.exe'

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
