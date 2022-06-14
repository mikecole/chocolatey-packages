$checksum = 'a032833a56cdaf20d475e3e394a5d242544547674f080e60ba94833c875b19b6'
$url = 'https://downloads.plex.tv/plex-media-server-new/1.27.0.5897-3940636f2/windows/PlexMediaServer-1.27.0.5897-3940636f2-x86.exe'

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
