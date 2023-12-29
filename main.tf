
module "initiatives" {
  source   = "./modules/initiatives"
  for_each = var.initiatives

  name         = each.key
  display_name = each.value.display_name
  description  = each.value.description
  metadata     = each.value.metadata

  scope      = each.value.scope
  policies   = each.value.policies
  parameters = each.value.parameters
}

module "assignments_management_group" {
  source   = "./modules/assignment/management_group"
  for_each = { for k, v in var.assignments : k => v if v.type == "management_group" }

  name         = each.key
  display_name = each.value.display_name
  description  = each.value.description
  location     = var.location

  scope         = join("/", ["/providers", "Microsoft.Management", "managementGroups", each.value.scope])
  definition_id = each.value.definition_id == null ? module.initiatives[each.value.initiative_id].id : each.value.definition_id

  parameters       = try(var.parameters[each.key], null)
  rbac_group_names = each.value.rbac_group_names

  depends_on = [
    module.initiatives
  ]
}

module "assignments_subscription" {
  source   = "./modules/assignment/subscription"
  for_each = { for k, v in var.assignments : k => v if v.type == "subscription" }

  name         = each.key
  display_name = each.value.display_name
  description  = each.value.description
  location     = var.location

  scope         = join("/", ["/subscriptions", each.value.scope])
  definition_id = each.value.definition_id == null ? module.initiatives[each.value.initiative_id].id : each.value.definition_id

  parameters       = try(var.parameters[each.key], null)
  rbac_group_names = each.value.rbac_group_names

  depends_on = [
    module.initiatives
  ]
}