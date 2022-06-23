$checksum = 'a13c3909cd3f1d1011a1291c84ee7069b04a54266cd86d976a86c78fd200187d'
$url = 'https://downloads.plex.tv/plex-media-server-new/1.27.1.5916-6b0e31a64/windows/PlexMediaServer-1.27.1.5916-6b0e31a64-x86.exe'

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
