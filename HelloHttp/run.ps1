using namespace System.Net

param($Request, $TriggerMetadata)

Write-Host "PowerShell HTTP trigger function processed a request."

$name = $Request.Query.name

if (-not $name -and $Request.Body) {
    if ($Request.Body -is [string]) {
        try {
            $bodyObject = $Request.Body | ConvertFrom-Json -ErrorAction Stop
            $name = $bodyObject.name
        } catch {
            $name = $null
        }
    } else {
        $name = $Request.Body.name
    }
}

$statusCode = [HttpStatusCode]::OK
$body = [ordered]@{
    message = "PowerShell Azure Function is running. Pass a 'name' in the query string or JSON body for a personalized response."
    timestampUtc = [DateTime]::UtcNow.ToString("o")
}

if ($name) {
    $body.message = "Hello, $name. Your PowerShell Azure Function is running."
} else {
    $statusCode = [HttpStatusCode]::BadRequest
}

Push-OutputBinding -Name Response -Value ([HttpResponseContext]@{
    StatusCode = $statusCode
    ContentType = "application/json"
    Body = ($body | ConvertTo-Json)
})
