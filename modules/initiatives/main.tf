
locals {
  policies = merge(azurerm_policy_definition.custom, data.azurerm_policy_definition.built_in)

  parameters = { for k, v in var.parameters : k => {
    type = v
    metadata = {
      displayName = k
      description = "Policy parameter '${k}' of type '${v}'."
    }
  } }
}

data "azurerm_policy_definition" "built_in" {
  for_each = { for k, v in var.policies : k => v
    if v.type == "BuiltIn"
  }
  name = each.value.id
}

resource "azurerm_policy_definition" "custom" {
  for_each = { for k, p in var.policies : k => jsondecode(file("${path.module}/_definitions/${p.id}"))
    if p.type == "Custom"
  }

  name         = each.key
  display_name = each.value.properties.displayName
  description  = each.value.properties.description
  metadata     = jsonencode(each.value.properties.metadata)

  mode        = each.value.properties.mode
  policy_type = each.value.properties.policyType
  parameters  = try(jsonencode(try(each.value.properties.parameters)), null)
  policy_rule = jsonencode(each.value.properties.policyRule)

  management_group_id = join("/", ["/providers", "Microsoft.Management", "managementGroups", var.scope])
}

resource "azurerm_policy_set_definition" "set" {
  name         = var.name
  display_name = var.display_name
  description  = var.description
  policy_type  = "Custom"

  metadata            = length(var.metadata) > 0 ? jsonencode(var.metadata) : null
  parameters          = length(var.parameters) > 0 ? jsonencode(local.parameters) : null
  management_group_id = join("/", ["/providers", "Microsoft.Management", "managementGroups", var.scope])

  dynamic "policy_definition_reference" {
    for_each = local.policies

    content {
      policy_definition_id = policy_definition_reference.value["id"]
      parameter_values = jsonencode(try({
        for p in keys(jsondecode(policy_definition_reference.value["parameters"])) : p => {
          value = "[parameters('${p}')]"
        }
      }, {}))
    }
  }
}