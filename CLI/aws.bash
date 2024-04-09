# AWS
# dev - 922056656510
# prod - 213397030215

# login
aws-azure-login --profile saml --mode gui

####
#### services
####

# ec2 describe
aws ec2 describe-instances
aws ec2 describe-instances --filters Name=tag:deployment_id,Values=c3e0e6-dev
aws ec2 describe-instances --filters Name=tag:deployment_id,Values=c3e0e6-dev --query "Reservations[].Instances[].InstanceId" --output text

# ec2 connect
aws ec2-instance-connect ssh --os-user hjiang --instance-id i-04acf74fa9126b670 --profile saml
ssh -L 5432:eligibility-service-aurora-c3e0e6-dev.cluster-cmlaglbozjbo.us-east-1.rds.amazonaws.com:5432 hjiang@i-04acf74fa9126b670 -o ProxyCommand="aws ec2-instance-connect open-tunnel --instance-id i-04acf74fa9126b670"

# ecs
aws ecs list-task-definitions --family-prefix eligsvc

# ecs deregister
aws ecs deregister-task-definition --region us-east-1 --output text --task-definition eligsvc-fa5eef-dev-app-svc:1
aws ecs deregister-task-definition --region us-east-1 --output text --task-definition eligsvc-fa5eef-dev-cadvisor:1

# ecs delete
aws ecs delete-task-definitions --region us-east-1 --output text --task-definition eligsvc-05e5cb-local-app-svc:1
aws ecs delete-task-definitions --region us-east-1 --output text --task-definition eligsvc-05e5cb-local-cadvisor:1
aws ecs delete-task-definitions --region us-east-1 --output text --task-definition eligsvc-05e5cb-local-logrouter:1
aws ecs delete-task-definitions --region us-east-1 --output text --task-definition eligsvc-05e5cb-local-phone-home:1

# s3
aws s3 ls

# iam
aws iam get-group --group-name MyIamGroup

# secretsmanager
aws secretsmanager describe-secret --secret-id iac/datafabric/integration/aws-root-nonprod-0088/eligibility-service-aurora-947726-dev --region us-east-1
aws secretsmanager delete-secret --force-delete-without-recovery --region us-east-1 --secret-id iac/datafabric/development/aws-root-nonprod-0088/eligsvcdb-14a62f-local-eligsvc_sc
aws secretsmanager delete-secret --force-delete-without-recovery --region us-west-2 --secret-id iac/datafabric/development/aws-root-nonprod-0088/eligsvcdb-14a62f-local-eligsvc_rw

# route53
aws route53 delete-hosted-zone --id Z00498262HXXA6GMUTZ2Z

# rds
aws-azure-login --profile saml
# get bastion host instance ID
aws ec2 describe-instances --filters Name=tag:jumpserver,Values=true --query "Reservations[].Instances[].InstanceId" --output text
# connect to an ec2 instance
aws ec2-instance-connect ssh --os-user <YOUR_USERNAME> --instance-id <EC2_BASTION_INSTANCE_ID> --profile saml
# (will be prompted for your OpenLDAP password)
# ssh into your application instance from Bastion
ssh <PRIVATE_IP_OF_APPLICATION_INSTANCE>
# run psql and connect to a db (lookup passwd from secrets manager, use readonly credentials)
sudo docker run -it --rm postgres:13-alpine psql -h <DBHOST> -U <DB_USERNAME> -d insmgmt
