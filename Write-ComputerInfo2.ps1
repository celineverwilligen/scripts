$file = Get-Content "C:\Users\Céline\Scripts\ComputerInfo.csv"
$dir = "c:\Users\Céline\Scripts\ComputerInfo\"
$empty = ""

while ($true) {
    $optie = $file | Out-GridView -PassThru
    while (!$optie) {exit 0}

    $openfile = Get-ChildItem $dir | Where-Object { $_.Name.StartsWith($optie) } | Out-GridView -PassThru
    if ($openfile.count -eq 1) {
        Get-Content ($dir + $openfile) | Out-GridView -PassThru
    }
    if ($openfile.count -eq 2) {
        $object1 = Get-Content $openfile[0].FullName
        $object2 = Get-Content $openfile[1].FullName
        $compare = Compare-Object $object1 $object2 | Out-GridView -PassThru
    }
}