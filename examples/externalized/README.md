
# Examples

## Externalized
This example uses a fully externalised configuration approach for policy initiatives, assignments and parameters. 
The configuration shown here can be changed as required and managed in a dedicated GIT repository as code, for example.

### Terraform 
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

The file `locals.tf` contains all provides example custom policies, initiatives and parameters as a blueprint ready to deploy. 