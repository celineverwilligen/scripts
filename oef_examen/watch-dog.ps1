$prog = $args[0]
$ErrorActionPreference= 'SilentContinue'

if (!$prog) {Write-Host 'geef parameter mee!'}

Get-Process $prog -ErrorAction silentlycontinue
$proc = $?
do {
    if (!$proc) {
        & $prog
        Write-Host "loopt"
        Get-Process $prog -ErrorAction silentlycontinue
        $proc = $?
    }
    else {
    
        Start-Sleep 2 
        
        Get-Process $prog -ErrorAction silentlycontinue
        $proc = $?

   
    }
} while ($true)