$checksum = '62bd279adcc7a43b8c861426c6f7819953f790a61bffa077f93ebfb556b7803c'
$url = 'https://downloads.plex.tv/plex-media-server-new/1.24.2.4973-2b1b51db9/windows/PlexMediaServer-1.24.2.4973-2b1b51db9-x86.exe'

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
