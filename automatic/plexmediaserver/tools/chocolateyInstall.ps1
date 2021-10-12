$checksum = '0a4970f8724c971960661a3866f53bade2e42fc2c79d5714bd4f726d40408591'
$url = 'https://downloads.plex.tv/plex-media-server-new/1.24.4.5081-e362dc1ee/windows/PlexMediaServer-1.24.4.5081-e362dc1ee-x86.exe'

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
