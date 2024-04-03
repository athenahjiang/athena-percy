####
#### layers
####

# 1. aws config
# https://us-east-1.console.aws.amazon.com/console/home?region=us-east-1#

# 2. hashicorp terraform aws provider
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs

# 3. athena iac tf module
# https://bitbucket.athenahealth.com/projects/DI
# https://bitbucket.athenahealth.com/projects/PDFSA

# 4. athena product tf module

resource = create
data = reference

####
#### input
####

# variable - static input parameters for a module
variable "team" {
  default = "collector"
  type = string
  description = "yes"
}

# access
var.team

# initialize
# 1. command line
# terraform apply -var="image_id=ami-abc123" -var="instance_type=t2.micro"
# terraform apply -var='image_id_list=["ami-abc123","ami-def456"]'
# terraform apply -var='map={"us-east-1":"ami-abc123","us-east-2":"ami-def456"}'
# 2. files env.tfvars (override for env specific needs)
# terraform apply -var-file="testing.tfvars"
# files named exactly "terraform.tfvars" or "terraform.tfvars.json" are auto loaded
# any files named ending in ".auto.tfvars" or ".auto.tfvars.json" are auto loaded
# tfvars.json are parsed as JSON objects
# 3. environment variables
# export TF_VAR_image_id=ami-abc123
# terraform plan

# Output
# Return values for a module
output "ecs_cluster" {
  value       = aws_ecs_cluster.ecs_cluster_core
  description = "All objects of ecs cluster"
}

# Resource
# Only meaningful within a module and must be unique within a module
# Actually create a resource
# First word is static imported
# Second word is custom
resource "aws_instance" "web" {
  ami           = "ami-a1b2c3d4"
  instance_type = "t2.micro"
}

# Module
# Container for multiple resources that are used together
# Data inside module call are input parameters of other modules
module "servers" {
  source = "./app-cluster"
  servers = 5
  # Resources of the other module must be created before creating resources of this module
  depends_on = [module.something_else]
}
# Access
security_group_id = module.postgres.security_group_id

# Data
# Referrence some data
# Dynamic info about entities that are not managed by the current TF
data "aws_caller_identity" "current" {}
data "http" "glance_data" {
  url = "https://glance.aws.athenahealth.com/api/accounts/${data.aws_caller_identity.current.account_id}" # this will be filled in dynamically
}
