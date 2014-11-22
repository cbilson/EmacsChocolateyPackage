$emacsNameVersion = 'emacs-24.4'
$src = "http://ftp.gnu.org/pub/gnu/emacs/windows/$($emacsNameVersion)-bin-i686-pc-mingw32.zip"
$toolsDir =  Split-Path -parent $MyInvocation.MyCommand.Definition
Install-ChocolateyZipPackage 'Emacs' $src $toolsDir

