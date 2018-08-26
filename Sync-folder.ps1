function copystuff
{
    param( $path1, $path2 )

    $items1 = Get-ChildItem -Path $path1
    $items2 = Get-ChildItem -Path $path2

    foreach ($item1 in $items1)
    {
        if($item1.PSIsContainer)
        {
            if (!(Test-Path ($path2+"\"+$item1)))
            {
                New-Item ($path2+"\"+$item1) -ItemType Directory >> null
                Write-Host ("Created Directory "+$item1+" in "+$path2)
            }
            copystuff ($path1+"\"+$item1) ($path2+"\"+$item1)
        } else
        {
            if (Test-Path ($path2+"\"+$item1))
            {
                if ((Get-FileHash ($path1+"\"+$item1)).Hash -ne (Get-FileHash ($path2+"\"+$item1)).Hash)
                {
                    Remove-Item ($path2+"\"+$item1)
                    Copy-Item ($path1+"\"+$item1) ($path2+"\"+$item1)
                    Write-Host ("Updated File "+$item1+" in "+$path2 ) -foregroundcolor Magenta
                }
            } else
            {
                Copy-Item ($path1+"\"+$item1) ($path2+"\"+$item1)
                Write-Host ("Created File "+$item1+" in "+$path2)
            }
        }
    }
}

copystuff $args[0] $args[1]