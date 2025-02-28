param location string = resourceGroup().location

param apimName string
@allowed([
    'Basic'
    'BasicV2'
    'Consumption'
    'Developer'
    'Isolated'
    'Premium'
    'Standard'
    'StandardV2'
])
param apimSku string = 'Developer'
param apimPublisherEmail string
param apimPublisherName string

var defaultTags = {
    Environment: 'Dev'
}

resource apim 'Microsoft.ApiManagement/service@2024-05-01' = {
    name: apimName
    location: location
    tags: defaultTags
    sku: {
        name: apimSku
        capacity: 1
    }
    properties: {
        publisherEmail: apimPublisherEmail
        publisherName: apimPublisherName
    }
}
