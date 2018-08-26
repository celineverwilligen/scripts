$programma= Read-Host "geef de programmanaam aub"
$ErrorActionPreference= 'SilentContinue'

if ($programma -eq " " )
{ Write-Host "geef programma" 
exit
}
while ($true) {
$procesActive = Get-Process $programma
if ($procesActive -eq $null){
start $programma
}
}
