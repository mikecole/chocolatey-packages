$ErrorActionPreference = 'Stop'
$checksum = '4e7137fb4b349325b2880fff98a473cc1179bd15bc244e73f3b6861a53ffff86'
$checksum64 = '9197f8bfb0ad6737ffa3b74c487c0dfab3ae08c51cd64e9b4395b3471bc5940d'

$url = 'https://cdn.zoom.us/prod/6.3.11.60501/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/6.3.11.60501/x64/ZoomInstallerFull.msi'

$silentArgs = '/quiet /qn /norestart'

$pp = Get-PackageParameters

if ($pp['DisableRestartManager']) { $silentArgs += " MSIRestartManagerControl=Disable" }
if ($pp['NoAutoUpdate']) { $silentArgs += " ZoomAutoUpdate=False" }
else { $silentArgs += " ZoomAutoUpdate=True" }
if ($pp['NoDesktopShortcut']) { $silentArgs += " zNoDesktopShortCut=True" }
if ($pp['NoInstallIfRunning']) { 
  if (Get-Process zoom -ea 0) {
    Write-Warning "Exiting installation because Zoom is running and /NoInstallIfRunning was passed."
    exit 1
  }
}
if ($pp['SilentStart']) { $silentArgs += " zSilentStart=True" }
if ($pp['SSOHost']) { $silentArgs += " zSSOHost=$(pp['SSOHost'])" }

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  fileType       = 'msi'
  url            = $url
  url64          = $url64
  silentArgs     = $silentArgs
  validExitCodes = @(0, 3010)
  softwareName   = 'zoom*'
  checksum       = $checksum
  checksum64     = $checksum64
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
}

$ZoomPath = Join-Path -Path $Env:ProgramFiles -ChildPath 'Zoom\bin\Zoom.exe'

[Version]$InstalledVersion = (Get-ItemProperty -Path $ZoomPath -ErrorAction:Ignore).VersionInfo.FileVersionRaw

$UpdateNeeded = $InstalledVersion -lt [Version]$Env:ChocolateyPackageVersion

if ($UpdateNeeded -or $Env:ChocolateyForce)
{
  Install-ChocolateyPackage @packageArgs
}
