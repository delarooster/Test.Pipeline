@description('A 3-4 letter customer affix')
param clientAffix string
@description('A 2 letter designator for the environment')
param env string = 'dv'
@description('The environment index - 0 is the default for the initial environment')
@minValue(0)
@maxValue(9)
param envIndex int = 0
@description('A 3-9 letter project affix')
param projectAffix string
@description('Set to true when the project affix is generic ie Remote Monitoring (rmtmon), traXsmart (txs), etc ')
param qualifyProjectAffix bool = false
@description('The location of the resource group')
param location string = resourceGroup().location

var clientAffixTitleCase = '${toUpper(first(clientAffix))}${toLower(substring(clientAffix, 1, (length(clientAffix) - 1)))}'
var envIndexVar = ((envIndex > 0) ? envIndex : '')
var projectAffixTitleCase = '${toUpper(first(projectAffix))}${toLower(substring(projectAffix, 1, (length(projectAffix) - 1)))}'
var namingPrefix = '${env}${(qualifyProjectAffix ? '${clientAffixTitleCase}${toLower(projectAffixTitleCase)}' : clientAffixTitleCase)}${envIndexVar}'
var resourceNames = {
  acr: '${namingPrefix}Acr'
}

module environment 'config/envSettings.bicep' = {
  name: 'environmentSettings'
  params: {
    environment: toLower(env)
  }
}

module acr 'br:dvmeshtemplatesacr.azurecr.io/mesh/acr:1.0.2' = {
  name: resourceNames.acr
  params: {
    name: resourceNames.acr
    location: location
    tags: environment.outputs.settings.tags
  }
}

output acrName string = acr.outputs.name
