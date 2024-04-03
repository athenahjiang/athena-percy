variable "account_type" { default = "nonprod" }

variable "environment" { default = "dev" }

variable "deployment_id" { default = "1254-dev" }
variable "sanitized_scm_branch" { default = "1254" }
variable "scm_branch" { default = "feature/COLTEC-1254-infra-gates" }

variable "region_name" { default = "us-east-1" }

# tfvars
container_image       = "docker.artifactory.aws.athenahealth.com/coltec/eligibility-service/application:feature-coltec-1254-infra-gates-1-04fc2b7-20240102230139"
is_destroy = false
eventing_lambda_filepath                = "../../eventing-lambda/target/eventing-lambda-0.0.1-SNAPSHOT-aws.jar"
