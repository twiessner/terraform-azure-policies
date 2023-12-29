
variable "location" {
  type = object({
    name  = string
    short = string
    mini  = string
  })
  description = "Specifies the supported Azure region to use this resource."
}

variable "name" {
  type        = string
  description = "Specifies the identifier (workload, team or application name) for the name creation."
}

variable "display_name" {
  type = string
}

variable "description" {
  type = string
}

variable "scope" {
  type = string
}

variable "definition_id" {
  type = string
}

variable "parameters" {
  type    = any
  default = null
}

variable "rbac_group_names" {
  type        = set(string)
  description = "Specifies the Azure AD group names, to assign the System Assigned Managed Identity of the policy assignment."
}