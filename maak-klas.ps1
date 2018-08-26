$header = "Path", "Naam", "Aantal"
$klassen = Import-Csv C:\temp\klassen.csv -Header $header



function Klas ($path, $Naam, $Aantal){
New-Item -ItemType Directory -Path $path -Force
    For ($i =1 ; $i -lt $Aantal; $i++){
        $a = [string]$i
        $p = $path+"\"+$Naam+$a
        New-Item -Path $p -ItemType File -Force


    }

}


foreach ($klas in $klassen){
    Klas $klas.Path $klas.Naam $klas.Aantal 
}