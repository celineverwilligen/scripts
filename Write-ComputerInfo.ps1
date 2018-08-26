##########################################################################
#Author: Céline Verwilligen
#Version: 1
#Name: Write-computerInfo.ps1
##########################################################################

<#
.SYNOPSIS

.DESCRIPTION

#>

$data= Import-Csv C:\Users\Céline\scripts\ComputerInfo.csv


$output = $data | Out-GridView -OutputMode Single

$cim = Get-CimInstance $output.H1 | Out-GridView  -OutputMode Single
$file =  Get-Content "C:\Users\Céline\Scripts\ComputerInfo.csv"
$date = Get-Date -Format "_yyyyMMdd_HHmmss"

function Write-ComputerInformation{
 param([string]$output)
 Get-CimInstance $output | Add-Content ("C:\Users\Céline\scripts\ComputerInfo\"+$output+$date+".csv")
}

foreach ($output in $file){
    Write-ComputerInformation $output
}

