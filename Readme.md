
# Demo ignite 2022

## Prérequis
    - .NET SDK >= 7.0 
    - Azure CLI >= 2.40
    - Azure developer CLI >= 0.2.0
    - Bicep >=0.10.61
    - Github CLI > 2.0 

### Installer avec Winget

```sh
    # Azure developer CLI has yo be installed using the github repo https://github.com/Azure/azure-dev
    winget install GitHub.cli dotnet-sdk-preview Microsoft.AzureCLI Microsoft.Bicep
     # Azure-cli stores bicep executable in its own PATH
    az bicep upgrade
```

### Installer avec Chocolatey

```sh
    # Azure developer CLI has yo be installed using the github repo https://github.com/Azure/azure-dev
    choco install dotnet --pre 
    choco install gh azure-cli bicep
    # Azure-cli stores bicep executable in its own PATH
    az bicep upgrade
```
## Development

### API
In `src/api` run 

    dotnet run 


### Deployment
```sh
# Make sure to be connected to your Azure account 
    azd up
```