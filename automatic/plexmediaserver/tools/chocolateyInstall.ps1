$checksum = 'c960d02a7254595ec88a9e6aa5c73cb4f4d4d83c8bd37a9433d522344b3c577a'
$url = 'https://downloads.plex.tv/plex-media-server-new/1.28.1.6092-87136b92b/windows/PlexMediaServer-1.28.1.6092-87136b92b-x86.exe'

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
