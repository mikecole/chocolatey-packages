$checksum = '89f6cf3bccdf0a52f6e44319fadf4e3baa6fb23b855fd9ab90725d40b9e014c8'
$url = 'https://downloads.plex.tv/plex-media-server-new/1.31.1.6782-77dfff442/windows/PlexMediaServer-1.31.1.6782-77dfff442-x86.exe'

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
