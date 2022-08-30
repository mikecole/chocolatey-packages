$checksum = '43117bcb6edd1981d46ebc8889f08c2cfdf77884042d5ee1f43fce511ffeee09'
$url = 'https://downloads.plex.tv/plex-media-server-new/1.28.2.6151-914ddd2b3/windows/PlexMediaServer-1.28.2.6151-914ddd2b3-x86.exe'

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
