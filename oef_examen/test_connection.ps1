#voor server : Test-Connection
#test-connection dwdmadwsa137 -count 2 -delay 60 | select __SERVER, Address, ProtocolAddress, ResponseTime | out-file c:\temp\test-connection.txt -append

# First we create the request.
$HTTP_Request = [System.Net.WebRequest]::Create('http://google.com')
$namefile = "logfile"
$path = "C:\temp"
$file = $path + "\" + $namefile


if (!(Test-Path $file)) {
    New-Item -ItemType "file" -Name $namefile -Path $path
}
else {
    Write-Host "File exists!"
}

do {

    Start-Sleep 2

    # We then get a response from the site.
    $HTTP_Response = $HTTP_Request.GetResponse()
    
    # We then get the HTTP code as an integer.
    $HTTP_Status = [int]$HTTP_Response.StatusCode

    $HTTP_time = $HTTP_Response.LastModified
    $HTTP_uri = $HTTP_Response.ResponseUri

    If ($HTTP_Status -eq 200) {
        $x = 'WEB UP     ' + $HTTP_time + "     " + $HTTP_uri
    }
    Else {
        $x = 'WEB DOWN     ' + $HTTP_time + "     " + $HTTP_uri
    }


    Add-Content -Path $file -Value $x
} while (1) 


# Finally, we clean up the http request by closing it.
$HTTP_Response.Close()