$file = Get-Content .\filelist.txt

foreach ($line in $file){
Get-Content $line
}

for ($i =1 ; $i -lt $file.Length; $i++){
Get-Content $file[$i]
}

