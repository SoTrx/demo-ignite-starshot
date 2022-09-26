param environmentName string
param location string = resourceGroup().location
param principalId string = ''
param apiImageName string = ''

// Container apps host (including container registry)
module containerApps './core/host/container-apps.bicep' = {
  name: 'container-apps'
  params: {
    environmentName: environmentName
    location: location
    logAnalyticsWorkspaceName: monitoring.outputs.logAnalyticsWorkspaceName
  }
}

// Api backend
module api './app/api.bicep' = {
  name: 'api'
  params: {
    environmentName: environmentName
    location: location
    imageName: apiImageName
    applicationInsightsName: monitoring.outputs.applicationInsightsName
    containerAppsEnvironmentName: containerApps.outputs.containerAppsEnvironmentName
    containerRegistryName: containerApps.outputs.containerRegistryName
    keyVaultName: keyVault.outputs.keyVaultName
  }
}

// Store secrets in a keyvault
module keyVault './core/security/keyvault.bicep' = {
  name: 'keyvault'
  params: {
    environmentName: environmentName
    location: location
    principalId: principalId
  }
}

// Monitor application with Azure Monitor
module monitoring './core/monitor/monitoring.bicep' = {
  name: 'monitoring'
  params: {
    environmentName: environmentName
    location: location
  }
}

output API_URI string = api.outputs.API_URI
output APPLICATIONINSIGHTS_CONNECTION_STRING string = monitoring.outputs.applicationInsightsConnectionString
output AZURE_CONTAINER_REGISTRY_ENDPOINT string = containerApps.outputs.containerRegistryEndpoint
output AZURE_CONTAINER_REGISTRY_NAME string = containerApps.outputs.containerRegistryName
output AZURE_KEY_VAULT_ENDPOINT string = keyVault.outputs.keyVaultEndpoint
