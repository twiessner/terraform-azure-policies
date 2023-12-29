
module "policy_blueprint" {
  source = "../../"

  location    = var.location
  initiatives = local.initiatives
  assignments = local.assignments
  parameters  = local.parameters
}