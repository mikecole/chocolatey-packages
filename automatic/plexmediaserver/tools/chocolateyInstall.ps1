$checksum = '8a07d049f25f20d70c68f07961395f78e832a79b0fdcb8f48662065197d5df88'
$url = 'https://downloads.plex.tv/plex-media-server-new/1.30.2.6563-3d4dc0cce/windows/PlexMediaServer-1.30.2.6563-3d4dc0cce-x86.exe'

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
