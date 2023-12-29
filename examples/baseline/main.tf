
locals {
  initiatives = {
    azure_general_initiative = {
      display_name = "Azure General Policy initiative"
      description  = "Azure General Policy initiative."
      scope        = "Home" # TomsTech
      parameters = {
        listOfAllowedLocations = "Array"
      }
      metadata = {
        version  = "0.5.0"
        category = "General"
      }
      policies = {
        enforce_allowed_locations = {
          type = "BuiltIn"
          id   = "e56962a6-4747-49cd-b67b-bf8b01975c4c"
        }
        enforce_locations_for_resource_groups = {
          type = "BuiltIn"
          id   = "e765b5de-1225-4ba3-bd56-1ac6695af988"
        }
      }
    }
    azure_storage_initiative = {
      display_name = "Azure Storage Policy initiative"
      description  = "Azure Storage Policy initiative."
      scope        = "Home" # TomsTech
      parameters = {

      }
      metadata = {
        version  = "0.5.0"
        category = "Storage"
      }
      policies = {
        enforce_storage_https = {
          type = "Custom"
          id   = "storage/storage_protocol_https.json"
        }
        enforce_storage_min_tls = {
          type = "Custom"
          id   = "storage/storage_min_tls_1_2.json"
        }
      }
    }
    azure_subscription_compliance_initiative = {
      display_name = "Azure Subscription Compliance Initiative"
      description  = "Azure Subscription Compliance Policy initiative description."
      scope        = "Home" # TomsTech
      parameters = {
        env = "String"
      }
      metadata = {
        version  = "0.5.0"
        category = "Compliance"
      }
      policies = {
        enforce_naming_convention_for_resource_groups = {
          type = "Custom"
          id   = "compliance/naming_convention_for_rg.json"
        }
        enforce_naming_convention_for_virtual_networks = {
          type = "Custom"
          id   = "compliance/naming_convention_for_vnet.json"
        }
        enforce_naming_convention_for_virtual_network_subnets = {
          type = "Custom"
          id   = "compliance/naming_convention_for_snet.json"
        }
      }
    }
  }

  assignments = {
    azure_general_initiative = {
      display_name  = "Azure General Policy initiative"
      description   = "Azure General Policy initiative description."
      type          = "management_group"
      scope         = "mg-lz" # Landing Zones
      initiative_id = "azure_general_initiative"
    }
    azure_storage_initiative = {
      display_name  = "Azure Storage Policy initiative"
      description   = "Azure Storage Policy initiative."
      type          = "management_group"
      scope         = "mg-lz" # Landing Zones
      initiative_id = "azure_storage_initiative"
    }
    saas_network_access = {
      display_name = "Azure SaaS Network Access Policy initiative"
      description  = "Azure SaaS Network Access Policy initiative."
      type         = "management_group"
      scope        = "mg-lz" # Landing Zones
      # https://www.azadvertizer.net/azpolicyinitiativesadvertizer/f1535064-3294-48fa-94e2-6e83095a5c08.html
      definition_id = "/providers/microsoft.authorization/policysetdefinitions/f1535064-3294-48fa-94e2-6e83095a5c08"
    }
    cis_benchmark_v_2_0_0 = {
      display_name = "CIS Microsoft Azure Foundations Benchmark v2.0.0"
      description  = "The Center for Internet Security (CIS) is a nonprofit entity whose mission is to identify, develop, validate, promote, and sustain best practice solutions for cyber defense."
      type         = "management_group"
      scope        = "mg-lz" # Landing Zones
      # https://www.azadvertizer.net/azpolicyinitiativesadvertizer/06f19060-9e68-4070-92ca-f15cc126059e.html
      definition_id = "/providers/microsoft.authorization/policysetdefinitions/06f19060-9e68-4070-92ca-f15cc126059e"
    }
    cloud_security_benchmark = {
      display_name = "Microsoft Cloud Security Benchmark"
      description  = "The Microsoft cloud security benchmark initiative represents the policies and controls implementing security recommendations defined in Microsoft cloud security benchmark."
      type         = "management_group"
      scope        = "mg-lz" # Landing Zones
      # https://www.azadvertizer.net/azpolicyinitiativesadvertizer/1f3afdf9-d0c9-4c3d-847f-89da613e70a8.html
      definition_id = "/providers/microsoft.authorization/policysetdefinitions/1f3afdf9-d0c9-4c3d-847f-89da613e70a8"
    }
    iso_27001_2013 = {
      display_name = "ISO 27001:2013"
      description  = "The International Organization for Standardization (ISO) 27001 standard provides requirements for establishing, implementing, maintaining, and continuously improving an Information Security Management System (ISMS)."
      type         = "management_group"
      scope        = "mg-lz" # Landing Zones
      # https://www.azadvertizer.net/azpolicyinitiativesadvertizer/89c6cddc-1c73-4ac1-b19c-54d1a15a42f2.html
      definition_id = "/providers/microsoft.authorization/policysetdefinitions/89c6cddc-1c73-4ac1-b19c-54d1a15a42f2"
    }
    azure_subscription_compliance_initiative_dev = {
      display_name  = "Azure Subscription Compliance Initiative"
      description   = "Azure Subscription Compliance Policy initiative description."
      type          = "subscription"
      scope         = "181688b9-abcc-4501-8896-c49d4dd1017d"
      initiative_id = "azure_subscription_compliance_initiative"
    }
    azure_subscription_compliance_initiative_prod = {
      display_name  = "Azure Subscription Compliance Initiative"
      description   = "Azure Subscription Compliance Policy initiative description."
      type          = "subscription"
      scope         = "3791e567-da74-42be-96fa-da4a36c58154"
      initiative_id = "azure_subscription_compliance_initiative"
    }
  }

  parameters = {
    azure_general_initiative = {
      listOfAllowedLocations = ["West Europe"]
    }
    saas_network_access = {
      "Effect-Microsoft.AppConfiguration-configurationStores" = "Deny"
      "Effect-AppServiceEnvironment"                          = "Deny"
      "Effect-Microsoft.Attestation-attestationProviders"     = "Deny"
      "Effect-Microsoft.Automation-automationAccounts"        = "Deny"
      "Effect-Microsoft.Batch-batchAccounts"                  = "Deny"
      "Effect-Microsoft.BotService-botServices"               = "Deny"
      "Effect-Microsoft.Cache-Redis"                          = "Deny"
      "Effect-Microsoft.CognitiveServices-accounts"           = "Deny"
      "Effect-Microsoft.ContainerRegistry-registries"         = "Deny"
      "Effect-Microsoft.DataFactory-factories"                = "Deny"
      "Effect-Microsoft.DBforMariaDB-servers"                 = "Deny"
      "Effect-Microsoft.DBforMySQL-flexibleServers"           = "Deny"
      "Effect-Microsoft.DBforMySQL-servers"                   = "Deny"
      "Effect-Microsoft.DBforPostgreSQL-flexibleServers"      = "Deny"
      "Effect-Microsoft.DBforPostgreSQL-servers"              = "Deny"
      "Effect-Microsoft.Databricks-workspaces"                = "Deny"
      "Effect-Microsoft.Devices-IotHubs"                      = "Deny"
      "Effect-Microsoft.Devices-IotHubProvisioningService"    = "Deny"
      "Effect-Microsoft.KeyVault-vaults"                      = "Deny"
      "Effect-Microsoft.DocumentDB-databaseAccounts"          = "Deny"
      "Effect-Microsoft.EventGrid-domains"                    = "Deny"
      "Effect-Microsoft.EventGrid-topics"                     = "Deny"
      "Effect-Microsoft.HybridCompute-privateLinkScopes"      = "Deny"
      "Effect-Microsoft.Insights-applicationInsights"         = "Deny"
      "Effect-Microsoft.MachineLearningServices-workspaces"   = "Deny"
      "Effect-Microsoft.Media-mediaServices"                  = "Deny"
      "Effect-Microsoft.OperationalInsights-LogAnalytics"     = "Deny"
      "Effect-Microsoft.Search-searchServices"                = "Deny"
      "Effect-Microsoft.ServiceBus-namespaces"                = "Deny"
      "Effect-Microsoft.SignalRService-SignalR"               = "Deny"
      "Effect-Microsoft.SignalRService-webPubSub"             = "Deny"
      "Effect-Microsoft.SQL-servers"                          = "Deny"
      "Effect-Microsoft.Storage-storageAccounts"              = "Deny"
      "Effect-Microsoft.Synapse-workspaces"                   = "Deny"
    }
    cis_benchmark_v_2_0_0 = {
      maximumDaysToRotate-d8cf8476-a2ec-4916-896e-992351803c44 = 365
    }
    azure_subscription_compliance_initiative_dev = {
      env = "dev"
    }
    azure_subscription_compliance_initiative_prod = {
      env = "prod"
    }
  }
}

module "azure_policies" {
  source = "../../"

  location    = var.location
  initiatives = local.initiatives
  assignments = local.assignments
  parameters  = local.parameters
}