targetScope = 'managementGroup'

@description('The prefix to use for the management group hierarchy.')
param prefix string = 'mg'

@description('The ID of the root management group under which to deploy the management group hierarchy.')
param rootManagementGroupId string

@description('The location for the deployment.')
param location string = deployment().location

var managementGroups = [
  {
    name: '${prefix}-platform'
    displayName: 'Platform'
    parentId: rootManagementGroupId
  }
  {
    name: '${prefix}-landingzones'
    displayName: 'Landing Zones'
    parentId: rootManagementGroupId
  }
  {
    name: '${prefix}-decommissioned'
    displayName: 'Decommissioned'
    parentId: rootManagementGroupId
  }
  {
    name: '${prefix}-sandbox'
    displayName: 'Sandbox'
    parentId: rootManagementGroupId
  }
  {
    name: '${prefix}-platform-identity'
    displayName: 'Identity'
    parentId: '${prefix}-platform'
  }
  {
    name: '${prefix}-platform-management'
    displayName: 'Management'
    parentId: '${prefix}-platform'
  }
  {
    name: '${prefix}-platform-connectivity'
    displayName: 'Connectivity'
    parentId: '${prefix}-platform'
  }
  {
    name: '${prefix}-landingzones-platform'
    displayName: 'Platform'
    parentId: '${prefix}-landingzones'
  }
  {
    name: '${prefix}-landingzones-applications'
    displayName: 'Applications'
    parentId: '${prefix}-landingzones'
  }
]

@batchSize(1)
module managementGroupDeployment 'br/public:avm/res/management/management-group:0.1.2' = [for mg in managementGroups: {
  name: 'deploy-${mg.name}'
  params: {
    location: location
    name: mg.name
    displayName: mg.displayName
    parentId: mg.parentId
  }
}]

output managementGroupIds array = [for (mg, i) in managementGroups: {
  name: mg.name
  id: managementGroupDeployment[i].outputs.resourceId
}]
