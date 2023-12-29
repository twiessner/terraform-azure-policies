
locals {
  group_names = { for g in var.rbac_group_names : g => g }
}

data "azuread_group" "group" {
  for_each = local.group_names

  display_name = each.key
}

resource "azuread_group_member" "member" {
  for_each = local.group_names

  group_object_id  = data.azuread_group.group[each.key].object_id
  member_object_id = var.principal_id
}