Install-ChocolateyZipPackage 'Emacs' 'http://ftp.gnu.org/pub/gnu/emacs/windows/emacs-24.3-bin-i386.zip' "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

# Pass emacs install directory to addpm.exe so that it doesn't prompt with an OK modal dialog box
. $env:ChocolateyInstall\lib\Emacs.24.3\tools\emacs-24.3\bin\addpm.exe "$env:ChocolateyInstall\lib\Emacs.24.3\tools\emacs-24.3"
