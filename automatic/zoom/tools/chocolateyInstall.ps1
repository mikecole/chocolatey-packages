$ErrorActionPreference = 'Stop'
$checksum = '874049fa38119d381790bb79ec21919c9b92de29beaba4ea40ac76da8b129f32'
$checksum64 = 'b9a662f315a51abd168e427910962bc79ecbaa17d2a5d8af95c01d7b2bb7b7fc'

$url = 'https://cdn.zoom.us/prod/6.6.1.15968/ZoomInstallerFull.msi'
$url64 = 'https://cdn.zoom.us/prod/6.6.1.15968/x64/ZoomInstallerFull.msi'

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
