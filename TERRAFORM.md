<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_assignments_management_group"></a> [assignments\_management\_group](#module\_assignments\_management\_group) | ./modules/assignment/management_group | n/a |
| <a name="module_assignments_subscription"></a> [assignments\_subscription](#module\_assignments\_subscription) | ./modules/assignment/subscription | n/a |
| <a name="module_initiatives"></a> [initiatives](#module\_initiatives) | ./modules/initiatives | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_assignments"></a> [assignments](#input\_assignments) | Specifies the data structure to define policy initiatives assignments. | <pre>map(object({<br>    display_name     = string<br>    description      = string<br>    type             = string<br>    scope            = string<br>    definition_id    = optional(string)<br>    initiative_id    = optional(string)<br>    rbac_group_names = optional(set(string), [])<br>  }))</pre> | n/a | yes |
| <a name="input_initiatives"></a> [initiatives](#input\_initiatives) | Specifies the data structure to define policy initiatives. | <pre>map(object({<br>    display_name = string<br>    description  = string<br>    parameters   = map(string)<br>    metadata     = map(string)<br>    policies = map(object({<br>      type = string<br>      id   = string<br>    }))<br>    scope = string<br>  }))</pre> | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Specifies the supported Azure region to use this resources. | <pre>object({<br>    name  = string<br>    short = string<br>    mini  = string<br>  })</pre> | n/a | yes |
| <a name="input_parameters"></a> [parameters](#input\_parameters) | Specifies the data structure (any) to define policy assignment parameters as a map of key (parameter name) value (parameter value) pairs. | `any` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->