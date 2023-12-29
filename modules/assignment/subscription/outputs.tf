
output "id" {
  value = azurerm_subscription_policy_assignment.sub.id
}

output "name" {
  value = azurerm_subscription_policy_assignment.sub.name
}

output "location" {
  value = azurerm_subscription_policy_assignment.sub.location
}

output "subscription_group_id" {
  value = azurerm_subscription_policy_assignment.sub.subscription_id
}