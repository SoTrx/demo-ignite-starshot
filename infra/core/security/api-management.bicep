param environmentName string
param location string = resourceGroup().location

param sku string = ''
param capacity int = 0

var abbrs = loadJsonContent('../../abbreviations.json')
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))

// APIM to connect to the Power app client
resource apim 'Microsoft.ApiManagement/service@2021-08-01' = {
  name: '${abbrs.apiManagementService}${resourceToken}'
  location: location
  sku: {
    name: sku
    capacity: capacity
  }
  properties: {
    publisherEmail: 'justADev@contoso.com'
    publisherName: 'test'
  }
}
