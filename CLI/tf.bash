# download dependency
terraform init

# run grammar check
terraform validate

# plan state changes
terraform plan
terraform plan -var-file="dev.tfvars"
terraform plan -out=plan.tfplan
terraform plan -state="e1.tfstate" -var deploy_us_west_2=false

# apply
terraform apply
# coltec
terraform apply -var-file="dev.tfvars" -state="e1.tfstate"
# percy
terraform apply -state="states/e1.tfstate" -var deploy_us_west_2=false
terraform apply -state="states/w2.tfstate" -var deploy_us_west_2=true

# destroy
terraform destroy
# coltec
terraform destroy -var-file="dev.tfvars"
terraform destroy -var-file="dev.tfvars" -state="e1.tfstate"
terraform destroy -var-file="dev.tfvars" -state="w2.tfstate" -var region_name="us-west-2" -var deployment_id="1297-devw2"
# percy
terraform destroy -state="states/e1.tfstate" -var deploy_us_west_2=false
terraform destroy -state="states/w2.tfstate" -var deploy_us_west_2=true

# deployment id
echo -n str | sha256sum
