$packageName = 'Emacs'
$url = 'http://ftp.gnu.org/gnu/emacs/windows/emacs-24.3-bin-i386.zip'
$nameAndVersion = 'emacs-24.3'

try {

    $binRoot = Get-BinRoot
    $instDir = Join-Path $binRoot $packageName   
    $emacsDir = Join-Path $instDir $nameAndVersion
    $emacsBinDir = Join-Path $emacsDir 'bin' 
    
    #install package
    Install-ChocolateyZipPackage $packageName $url $instDir
    
    # register in %PATH%
    Install-ChocolateyPath $emacsBinDir 'User'
    
} catch {
    Write-ChocolateyFailure $packageName $($_.Exception.Message)
    throw
}
