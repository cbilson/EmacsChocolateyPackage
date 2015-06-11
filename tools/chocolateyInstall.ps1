$emacsNameVersion = 'emacs-24.5'
$src = "http://ftp.gnu.org/pub/gnu/emacs/windows/$($emacsNameVersion)-bin-i686-mingw32.zip"
$toolsDir =  Split-Path -parent $MyInvocation.MyCommand.Definition
Install-ChocolateyZipPackage 'Emacs' $src $toolsDir `
  -Checksum B867F51AC412B848D3CB17FDC8896040 `
  -ChecksumType MD5
