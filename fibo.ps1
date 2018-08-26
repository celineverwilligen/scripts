Write-Output " geef een getal in " 
$aantal = Read-Host

$c = 1
$p = 0
$teller

Write-Host 0
Write-Host 1
for ($teller=0;$teller -le $aantal;$teller++){
$temp = $p + $c
$p = $c
$c = $temp
Write-Host $temp
}