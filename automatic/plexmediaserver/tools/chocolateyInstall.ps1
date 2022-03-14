$checksum = 'b5f394af6efeb82761b8724667a8f08d2aba6e492cab17604962261bbae1a669'
$url = 'https://downloads.plex.tv/plex-media-server-new/1.25.6.5577-c8bd13540/windows/PlexMediaServer-1.25.6.5577-c8bd13540-x86.exe'

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
