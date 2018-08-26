$file = Get-Content -Path '.\ComputerInfo.csv' 
$dir = '.\ComputerInfo'


do {
    $optie = $file | Out-GridView -PassThru
    while (!$optie){exit 0}
    $d = $optie + "*"

    $open = Get-ChildItem -Path $dir -Filter $d | Out-GridView -PassThru

    if($open.count -eq 1 ){
        $path = $dir + "\"+$open
        Get-Content -Path $path | Out-GridView
    } elseif ($open.count -eq 2) {
        $path1 = $dir + "\"+$open[0].FullName
        $path2 = $dir + "\"+$open[1].FullName
        $obj1 = Get-Content -Path $path1
        $obj2 = Get-Content -Path $path2
        Compare-Object $obj1 $obj2 |Out-GridView 
    }
    

} while (1)