param environment string
param baseTime string = utcNow('u')
var settings = loadYamlContent('../../pipelines/variables.yaml')

var environmentSettings = {
  dv: {
    name: 'Develop'
    storage: {
      sku: 'Standard_LRS'
    }
    iotHub: {
      sku: 'S1'
      capacity: 1
    }
    dps: {
      sku: 'S1'
      capacity: 1
    }
    acr: {
      sku: 'Basic'
    }
    eventHub: {
      capacity: 1
      skuTier: 'Standard'
      skuName: 'Standard'
    }
    keyVault: {
      sku: {
        family: 'A'
        name: 'standard'
      }
    }
    postgres: {
      properties: {
        version: '14'
        highAvailability: {
          mode: 'Disabled'
        }
        backup: {
          backupRetentionDays: 7
          geoRedundantBackup: 'Disabled'
        }
        storage: {
          storageSizeGB: 32
        }
      }
      sku: {
        name: 'Standard_B1ms'
        tier: 'Burstable'
      }
    }
    redis: {
      sku: {
        name: 'Basic'
        family: 'C'
        capacity: 1
      }
    }
    tags: {
      Owner: settings.owner
      Project: settings.project
      Customer: settings.customer
      Repository: settings.repository
      'Date Last Deployed': baseTime
      'Service Connection': 'Dv_Contoso_Deploy'
      Tier: 'Dv'
    }
  }
  sg: {
    name: 'Staging'
    storage: {
      sku: 'Standard_LRS'
    }
    iotHub: {
      sku: 'S1'
      capacity: 1
    }
    dps: {
      sku: 'S1'
      capacity: 1
    }
    acr: {
      sku: 'Basic'
    }
    eventHub: {
      capacity: 1
      skuTier: 'Standard'
      skuName: 'Standard'
    }
    keyVault: {
      sku: {
        family: 'A'
        name: 'standard'
      }
    }
    postgres: {
      properties: {
        version: '14'
        highAvailability: {
          mode: 'Disabled'
        }
        backup: {
          backupRetentionDays: 7
          geoRedundantBackup: 'Disabled'
        }
        storage: {
          storageSizeGB: 32
        }
      }
      sku: {
        name: 'Standard_B1ms'
        tier: 'Burstable'
      }
    }
    redis: {
      sku: {
        name: 'Basic'
        family: 'C'
        capacity: 1
      }
    }
    tags: {
      Owner: settings.owner
      Project: settings.project
      Customer: settings.customer
      Repository: settings.repository
      'Date Last Deployed': baseTime
      'Service Connection': 'Dv_Contoso_Deploy'
      Tier: 'Sg'
    }
  }
  pd: {
    name: 'Production'
    storage: {
      sku: 'Standard_LRS'
    }
    iotHub: {
      sku: 'S1'
      capacity: 1
    }
    dps: {
      sku: 'S1'
      capacity: 1
    }
    acr: {
      sku: 'Basic'
    }
    eventHub: {
      capacity: 3
      skuTier: 'Standard'
      skuName: 'Standard'
    }
    keyVault: {
      sku: {
        family: 'A'
        name: 'standard'
      }
    }
    postgres: {
      properties: {
        version: '14'
        highAvailability: {
          mode: 'Disabled'
        }
        backup: {
          backupRetentionDays: 7
          geoRedundantBackup: 'Disabled'
        }
        storage: {
          storageSizeGB: 32
        }
      }
      sku: {
        name: 'Standard_B1ms'
        tier: 'Burstable'
      }
    }
    redis: {
      sku: {
        name: 'Basic'
        family: 'C'
        capacity: 1
      }
    }
    tags: {
      Owner: settings.owner
      Project: settings.project
      Customer: settings.customer
      Repository: settings.repository
      'Date Last Deployed': baseTime
      'Service Connection': 'Pd_Contoso_Deploy'
      Tier: 'Pd'
    }
  }
}

output settings object = environmentSettings[environment]
