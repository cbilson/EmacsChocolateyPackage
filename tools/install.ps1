$packageName = 'emacs'

$majorVersion = '26'
$minorVersion = '1'

$emacsNameVersion = "$($packageName)-$($majorVersion).$($minorVersion)"
$installDir = $(Split-Path -parent $MyInvocation.MyCommand.Definition) + '/' + $packageName

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $installDir
  url            = "http://ftp.gnu.org/pub/gnu/emacs/windows/emacs-$($majorVersion)/$($emacsNameVersion)-i686.zip"
  url64bit       = "http://ftp.gnu.org/pub/gnu/emacs/windows/emacs-$($majorVersion)/$($emacsNameVersion)-x86_64.zip"
  checksum       = 'd8c1486304462a368911acc4628ba5433d5d6af6a25511504f324a3cd405131b'
  checksumType   = 'sha256'
  checksum64     = '995a9da608c8dca75c385769c1c7bf212ac39713c0d14e9af2e718363b5e8264'
  checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

$emacsDepsVersion = "emacs-$($majorVersion)"

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $installDir
  url            = "http://ftp.gnu.org/pub/gnu/emacs/windows/emacs-$($majorVersion)/$($emacsDepsVersion)-i686-deps.zip"
  url64bit       = "http://ftp.gnu.org/pub/gnu/emacs/windows/emacs-$($majorVersion)/$($emacsDepsVersion)-x86_64-deps.zip"
  checksum       = '4ff9057d4407f2d1149f158a2920acd09c31eff12a09ba25dc1776a3978f41ad'
  checksumType   = 'sha256'
  checksum64     = '3501e0c7f31cbf98ef7ac5cbbc8bae04ef4a72f52b00898965a8d702c4a5fae7'
  checksumType64 = 'sha256'
}

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
