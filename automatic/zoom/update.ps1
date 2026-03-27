$ErrorActionPreference = 'Stop'
import-module au

$download_page_url = 'https://zoom.us/rest/download?os=win'
$url_part1 = 'https://cdn.zoom.us/prod/'

function global:au_SearchReplace {
    @{
        'tools\ChocolateyInstall.ps1' = @{
            "(^[$]checksum64\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum64)'"
            "(^[$]url64\s*=\s*)('.*')"   = "`$1'$($Latest.Url64)'"
        }
     }
}
function global:au_BeforeUpdate {
    $Latest.Checksum64 = Get-RemoteChecksum $Latest.URL64
}

function global:au_GetLatest {
    Write-Host "Checking download page: " + $download_page_url

    $response = Invoke-WebRequest -UseBasicParsing -Uri $download_page_url -Headers @{"Cache-Control"="no-cache"}
    $payload = ConvertFrom-Json $response

    Write-Host "Got response: " + $payload

     # Zoom no longer ships x86 builds. Track x64 channel for package versioning.
    $version = $payload.result.downloadVO.zoomX64.version
    $url64 = $url_part1 + $version + '/x64/ZoomInstallerFull.msi'

    $Latest = @{ URL64 = $url64; Version = $version }
    return $Latest
}

update -ChecksumFor none
