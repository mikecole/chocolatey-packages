$checksum = 'a97a711dd0fce92a7c27b0c36b6cac4a7989858fc73c47a86bdfc8cc17c7368c'
$url = 'https://downloads.plex.tv/plex-media-server-new/1.29.1.6316-f4cdfea9c/windows/PlexMediaServer-1.29.1.6316-f4cdfea9c-x86.exe'

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
