$checksum = '3a61c83eb2643b7aaced3fab4b18ed27e679d5c49fe455b4fda335c6209f1139'
$url = 'https://downloads.plex.tv/plex-media-server-new/1.28.1.6104-788f82488/windows/PlexMediaServer-1.28.1.6104-788f82488-x86.exe'

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
