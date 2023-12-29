
variable "tenant_id" {
  type = string
}

variable "subscription_dev_id" {
  type = string
}

variable "initiative_scope_management_group_id" {
  type = string
}

variable "initiative_assignment_management_group_id" {
  type = string
}

variable "location" {
  type = object({
    name  = string
    short = string
    mini  = string
  })
  description = "Specifies the supported Azure region to use this resource."
  default = {
    name  = "westeurope"
    short = "westeu"
    mini  = "weu"
  }
}