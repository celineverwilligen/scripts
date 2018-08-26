$header = 'nmb', 'prog'
$menu = Import-Csv C:\temp\menu.csv -Header $header
$n = 0
clear

do  {
    Write-Host 'Menu'
    Write-Host '----------'
    for ($i = 0; $i -lt $menu.count ; $i++ ) {
        Write-Host( $menu[$i].nmb + "     " + $menu[$i].prog)
    }



    $n = Read-Host 'kies een programma geef het nummer in'

    for ($i = 0; $i -lt $menu.count ; $i++ ) {

        if($n -eq 4){break}
        if ($n -eq $menu[$i].nmb) {
           & $menu[$i].prog
        }
    }
} until ($n -eq 4)
    