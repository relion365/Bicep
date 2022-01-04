param name string
param location string = 'westus2'

var workspaceName = '${name}Sentinel'
var sentinelName = 'SecurityInsights(${name}Sentinel)'

resource workspace 'Microsoft.OperationalInsights/workspaces@2015-11-01-preview' = {
  name: workspaceName
  location: location
  properties: {
    sku: {
        name: 'PerGB2018'
    }
  }
}

resource sentinel 'Microsoft.OperationsManagement/solutions@2015-11-01-preview' = {
    name: sentinelName
    location: location
    properties: {
        workspaceResourceId: workspace.id
    }
    plan: {
        name: sentinelName
        product: 'OMSGallery/SecurityInsights'
        publisher: 'Microsoft'
        promotionCode: ''
    }
}
