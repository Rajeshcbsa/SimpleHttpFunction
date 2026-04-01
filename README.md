# Simple PowerShell Azure Function

This folder contains a minimal Azure Functions project for PowerShell with one HTTP-triggered function.

## Files

- `host.json`: Function host configuration.
- `local.settings.json`: Local runtime settings.
- `requirements.psd1`: Managed PowerShell dependencies.
- `profile.ps1`: Cold-start profile script.
- `HelloHttp/function.json`: HTTP trigger binding definition.
- `HelloHttp/run.ps1`: Function implementation.

## Run locally

1. Install Azure Functions Core Tools.
2. Start Azurite or point `AzureWebJobsStorage` to a storage account.
3. From this folder, run `func start`.
4. Call `http://localhost:7071/api/hello?name=Raj`.

## Deploy

Deploy the contents of this folder to an Azure Function App configured for the PowerShell worker runtime.
