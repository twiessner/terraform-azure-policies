
locals {
  # convert a terraform map to a valid json parameter value structure
  parameters = var.parameters != null ? { for k, v in var.parameters : k => {
    value = v
  } } : null
}

resource "azurerm_management_group_policy_assignment" "mgmt" {
  name         = var.name
  display_name = var.display_name
  description  = var.description
  location     = var.location.name

  policy_definition_id = var.definition_id
  management_group_id  = var.scope
  parameters           = local.parameters != null ? jsonencode(local.parameters) : null

  identity {
    type = "SystemAssigned"
  }
}

# To simplify RBAC permissions, just add the created System Assigned Managed Identity to a Entry ID group
module "rbac" {
  source = "../../../modules/rbac"

  rbac_group_names = var.rbac_group_names
  principal_id     = azurerm_management_group_policy_assignment.mgmt.identity[0].principal_id

  depends_on = [
    azurerm_management_group_policy_assignment.mgmt
  ]
}