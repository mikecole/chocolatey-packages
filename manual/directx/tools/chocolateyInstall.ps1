$ErrorActionPreference = 'Stop'
$tempDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = 'directx'
  unzipLocation = $tempDir
  fileType      = 'exe'
  url           = 'https://download.microsoft.com/download/8/4/A/84A35BF1-DAFE-4AE8-82AF-AD2AE20B6B14/directx_Jun2010_redist.exe'
  silentArgs    = "/Q /T:$tempDir"
  validExitCodes= @(0)
  softwareName  = 'directx*'
  checksum      = '053F76DCBB28802E23341B6A787E3B0791C0FA5C8D4D011B1044172DBF89C73B'
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs

# Run the actual installer
$dxSetup = Join-Path $tempDir 'DXSETUP.exe'
Install-ChocolateyInstallPackage 'directx' 'exe' '/silent' "$dxSetup"
