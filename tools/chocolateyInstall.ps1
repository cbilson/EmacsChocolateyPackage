$packageName = 'emacs'
$emacsNameVersion = 'emacs-26.1'
$url = "https://ftp.gnu.org/pub/gnu/emacs/windows/$($emacsNameVersion)-i686.zip"
$url64 = "https://ftp.gnu.org/pub/gnu/emacs/windows/$($emacsNameVersion)-x86_64.zip"
$installDir =  $(Split-Path -parent $MyInvocation.MyCommand.Definition) + '/' + $packageName

$packageArgs = @{
    packageName    = $packageName
    unzipLocation  = $installDir
    url            = $url
    url64bit       = $url64
    checksum       = 'd8c1486304462a368911acc4628ba5433d5d6af6a25511504f324a3cd405131b'
    checksumType   = 'sha256'
    checksum64     = '995a9da608c8dca75c385769c1c7bf212ac39713c0d14e9af2e718363b5e8264'
    checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

# Exclude executables from getting shim
$guiExes = @("emacs.exe", "emacsclientw.exe")
$shimExes = @("runemacs.exe", "emacsclient.exe")

$guiFilter = "^" + $($guiExes -join "$|^") + "$"
$shimFilter = "^" + $($shimExes -join "$|^") + "$"

$files = Get-Childitem $installDir -include *.exe -recurse

foreach ($file in $files) {
    if ($file.Name -match $guiFilter) {
        #generate an gui file
        New-Item "$file.gui" -type file -force | Out-Null
    }
    elseif (-not ($file.Name -match $shimFilter)) {
        #generate an ignore file
        New-Item "$file.ignore" -type file -force | Out-Null
    }
}
