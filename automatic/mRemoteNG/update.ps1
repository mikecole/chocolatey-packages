$ErrorActionPreference = 'Stop'
import-module au

$latestRelease = 'https://api.github.com/repos/mRemoteNG/mRemoteNG/releases/latest'

function global:au_SearchReplace {
    @{
        'tools\ChocolateyInstall.ps1' = @{
            "(^[$]checksum\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum32)'"
            "(^[$]url\s*=\s*)('.*')"   = "`$1'$($Latest.Url)'"
        }
     }
}

function global:au_GetLatest {
    $windows_release = (Invoke-RestMethod $latestRelease).assets | Where-Object {$_.label -eq 'Normal Edition (msi)'}

    $url = $windows_release.browser_download_url
    $version32 = $windows_release.name.Replace("mRemoteNG-Installer-", "").Replace(".msi", "")
    
    @{
        URL = $url
        Version = $version32
    }
}

update -NoCheckUrl -ChecksumFor 32