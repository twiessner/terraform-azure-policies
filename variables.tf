
variable "location" {
  type = object({
    name  = string
    short = string
    mini  = string
  })
  description = "Specifies the supported Azure region to use this resources."
}

variable "initiatives" {
  type = map(object({
    display_name = string
    description  = string
    parameters   = map(string)
    metadata     = map(string)
    policies = map(object({
      type = string
      id   = string
    }))
    scope = string
  }))
}

variable "assignments" {
  type = map(object({
    display_name     = string
    description      = string
    type             = string
    scope            = string
    definition_id    = optional(string)
    initiative_id    = optional(string)
    rbac_group_names = optional(set(string), [])
  }))
}

variable "parameters" {
  type = any
}