
# Examples

## Externalized
This example uses a fully externalised configuration approach for policy initiatives, assignments and parameters. 
The configuration shown here can be changed as required and managed in a dedicated GIT repository as code, for example.

### Terraform 
The file `locals.tf` contains all provides example custom policies, initiatives and parameters as a blueprint ready to deploy.
You can simply try out the example, just create a file `tenant.auto.tfvars` and provide your values for 

```hcl
tenant_id       = "<your tenant_id>"
subscription_id = "<your subscription_id to assign the sample initiative>"

# Note: `initiative_definition_management_group_id` must be higher in the hierarchy of management_groups
initiative_definition_management_group_id = "<your management_group_id to save the initiative definition>"
initiative_assignment_management_group_id = "<your management_group_id to save the initiative assignment>"
```

Now you're ready to terraform it :-)

```bash
# init
terraform init

# plan
terraform plan

# apply
terraform apply

# destroy / clean up
terraform destroy
```
