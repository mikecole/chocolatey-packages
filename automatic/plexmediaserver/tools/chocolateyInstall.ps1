$checksum = '7bdefb1393fe8b108c619df056cc84b20beb4de43debe8c738027bce8e006faf'
$url = 'https://downloads.plex.tv/plex-media-server-new/1.23.6.4881-e2e58f321/windows/PlexMediaServer-1.23.6.4881-e2e58f321-x86.exe'

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
