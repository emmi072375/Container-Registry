targetScope = 'subscription'

param myResourceGroup string = 'ZellyTest520-rg'





@minLength(5)
@maxLength(50)
@description('Provide a globally unique name of your Azure Container Registry')
param acrName string = 'acremrantest20'

@description('Provide a location for the registry.')
param location string = 'swedencentral'

@description('Provide a tier of your Azure Container Registry.')
param acrSku string = 'Basic'




//Create Resource Group 

resource myRG01 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: myResourceGroup
  location: location

}


module myRegistry520 'containerregistry.bicep' = {
  name: 'myRegistryDeploy'
  scope: myRG01
  params: {
    acrName: acrName
    acrSku: acrSku
    location: location
  }
}
