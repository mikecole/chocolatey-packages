$checksum = '056f8c4b8ff02ba335f7dc775a25eea29072c4b5be6d7b625b89d466116e7ead'
$url = 'https://downloads.plex.tv/plex-media-server-new/1.24.0.4930-ab6e1a058/windows/PlexMediaServer-1.24.0.4930-ab6e1a058-x86.exe'

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
