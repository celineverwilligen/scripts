function  copyPasta ($path1, $path2) {
    $items1 = Get-ChildItem $path1
    $items2 = Get-ChildItem $path2

    foreach ($item1 in $items1) {
        if ($item1.PSIsContainer) {
            if (!(Test-Path $path2+"\"+$item1)) {
                New-Item -Name $item1 -Path $path2 -ItemType Directory

            }
            copyPasta $path1+"\"+$item1 $path2+"\"+$item1
        }
        else {
            if (!(Test-Path $path1)) {
                
                Copy-Item ($path1 + "\" + $item1)  ($path2 + "\" + $item1)
            }
            else {
                if ((Get-FileHash($path1 + "\" + $item1)).Hash -eq (Get-FileHash($path2 + "\" + $item1)).Hash) {
                    Write-Host 'hash gelijk'
                    else {
                        Remove-Item $path2+"\"+$item1
                        Copy-Item $path1+"\"+$item1 $path2+"\"+$item1
                    }
                }

            }
        }
    
    }
}
    copyPasta $args[0] $args[1]