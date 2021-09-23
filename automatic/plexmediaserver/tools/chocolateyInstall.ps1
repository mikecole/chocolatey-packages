$checksum = 'be20043e2dd9b570d59d536b25d2b003419c540a2a5588b4f6012fdfc56a1300'
$url = 'https://downloads.plex.tv/plex-media-server-new/1.24.3.5033-757abe6b4/windows/PlexMediaServer-1.24.3.5033-757abe6b4-x86.exe'

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
