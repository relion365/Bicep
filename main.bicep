targetScope = 'subscription'

@description('Enter company name here. It\'ll be used as a prefix for resource names.')
param name string

param location string = 'westus2'

var rgName  = '${name}SentinelRG'

resource rg 'Microsoft.Resources/resourceGroups@2021-04-01'={
  name: rgName
  location: location
}

module sentinel 'modules/sentinel.bicep'={
  scope: rg
  name: 'module_sentinel'
  params: {
    name: name
    location: rg.location
  }
}

