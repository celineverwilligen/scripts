$info = Import-Csv -path '.\ComputerInfo.csv'
Write-Host $info
function  Write-ComputerInformation ($x) {

    Write-Host $x
    
    $date = Get-Date -Format '_yyyymmdd_hhmmss'
    $file ='.\ci\'+ $x +'_'+$date
    Get-CimInstance $x | Set-Content -Path $file
    
}


foreach ($i in $info) {
    Write-ComputerInformation $i.h1
}