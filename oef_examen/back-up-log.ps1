$Path = "C:\temp\logfile"
$content = Get-Content -Path $Path

$maxlines = 3


$namefilebak = "logfile.bak"
$pathbak = "C:\temp"
$filebak = $pathbak + "\" + $namefilebak


if (!(Test-Path $filebak)) {
    New-Item -ItemType "file" -Name $namefilebak -Path $pathbak
}
else {
    Write-Host "File exists!"
}

if($content.count -ge $maxlines){
    Add-Content -Path $filebak -Value $content
    Set-Content -Path $Path -Value ""
}