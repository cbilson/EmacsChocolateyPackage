$emacsNameVersion = 'emacs-24.5'
$src = "http://ftp.gnu.org/pub/gnu/emacs/windows/$($emacsNameVersion)-bin-i686-mingw32.zip"
$toolsDir =  Split-Path -parent $MyInvocation.MyCommand.Definition
Install-ChocolateyZipPackage 'Emacs' $src $toolsDir

