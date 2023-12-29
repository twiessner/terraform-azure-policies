
variable "name" {
  type = string
}

variable "display_name" {
  type = string
}

variable "description" {
  type = string
}

variable "parameters" {
  type = map(string)
}

variable "metadata" {
  type    = map(string)
  default = {}
}

variable "policies" {
  type = map(object({
    type = string
    id   = string
  }))
  default = {}
}

variable "scope" {
  type = string
}