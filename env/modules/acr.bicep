param acrName string
param location string
param settings object
param tags object

resource containerRegistry 'Microsoft.ContainerRegistry/registries@2023-01-01-preview' = {
  name: acrName
  location: location
  sku: {
    name: settings.acr.sku
  }
  properties: {
    adminUserEnabled: true
  }
  tags: tags
}
