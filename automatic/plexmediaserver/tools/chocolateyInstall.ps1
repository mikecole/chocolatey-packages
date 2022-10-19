$checksum = '2475e81c1d5f096516a4c508548149f4caf9727df86f3bb5c0a8aa880584d61a'
$url = 'https://downloads.plex.tv/plex-media-server-new/1.29.1.6313-f4cdfea9c/windows/PlexMediaServer-1.29.1.6313-f4cdfea9c-x86.exe'

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
