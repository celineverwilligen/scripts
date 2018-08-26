$menu = Import-Csv -header "Nbr", "Name" menu.csv
clear

do {
    $menu | format-table

    $getal = read-host "wat"

    Write-Output $getal

    foreach ($line in $menu) {
        if ($getal -eq $line.nbr) {
            & $line.Name

        }
    }
} while ($getal -ne 4)
