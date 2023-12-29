
locals {
  parameters = var.parameters != null ? { for k, v in var.parameters : k => {
    value = v
  }} : null
}

resource "azurerm_subscription_policy_assignment" "sub" {
  name         = var.name
  display_name = var.display_name
  description  = var.description
  location     = var.location.name

  policy_definition_id = var.definition_id
  subscription_id      = var.scope
  parameters           = local.parameters != null ? jsonencode(local.parameters) : null

  identity {
    type = "SystemAssigned"
  }
}

module "rbac" {
  source = "../../../modules/rbac"

  rbac_group_names = var.rbac_group_names
  principal_id     = azurerm_subscription_policy_assignment.sub.identity[0].principal_id

  depends_on = [
    azurerm_subscription_policy_assignment.sub
  ]
}