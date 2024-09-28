$ErrorActionPreference = 'Stop'
$checksum = '0fe83b7313b644f343c13a188ade909991c958ae2f8bc779edc30be53b161cea'
$checksum64 = '3774f19db358af57e7c653196c17a785f1822137c7ffecf4b8d1e85b8951b7c9'

$url = 'https://cdn.zoom.us/prod/6.2.3.47507/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/6.2.3.47507/x64/ZoomInstallerFull.msi'

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
