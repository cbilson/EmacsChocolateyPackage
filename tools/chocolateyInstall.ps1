$emacsNameVersion = 'emacs-24.3'
$src = "http://ftp.gnu.org/pub/gnu/emacs/windows/${emacsNameVersion}-bin-i386.zip'
$toolsDir =  "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
Install-ChocolateyZipPackage 'Emacs' $src $toolsDir

# Pass emacs install directory to addpm.exe so that it doesn't prompt with an OK modal dialog box
. $toolsDir\$emacsNameVersion\bin\addpm.exe $toolsDir\emacsNameVersion
