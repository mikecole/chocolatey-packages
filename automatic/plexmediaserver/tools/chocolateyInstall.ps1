$checksum = 'c6033390f49672cc644b6592c7e3f24a16cf2e729c419f45f979e2ecfc51545b'
$url = 'https://downloads.plex.tv/plex-media-server-new/1.23.5.4862-0f739d462/windows/PlexMediaServer-1.23.5.4862-0f739d462-x86.exe'

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
