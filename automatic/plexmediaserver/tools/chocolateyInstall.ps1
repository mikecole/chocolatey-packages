$checksum = 'aea1bed9ab360f887253e9833b1979cd7487526f5035a44f778395d8cb1bbf1e'
$url = 'https://downloads.plex.tv/plex-media-server-new/1.24.5.5173-8dcc73a59/windows/PlexMediaServer-1.24.5.5173-8dcc73a59-x86.exe'

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
