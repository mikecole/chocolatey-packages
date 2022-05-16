$checksum = 'd36434d832c7b9ba1c28a5aa449a1f5c6672297c77b7df70527e1233d8110d03'
$url = 'https://downloads.plex.tv/plex-media-server-new/1.26.1.5798-99a4a6ac9/windows/PlexMediaServer-1.26.1.5798-99a4a6ac9-x86.exe'

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
