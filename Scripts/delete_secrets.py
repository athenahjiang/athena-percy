import boto3
import variables
import utils.secretsmanager as secretsmanager
import utils.utils as utils

print("percy: start")
print("percy: primary_region: ", variables.primary_region)
print("percy: replica_region: ", variables.replica_region)
print("percy: prefix_rds: ", variables.prefix_rds)

client = boto3.session.Session().client(service_name='secretsmanager',
                                        region_name=variables.primary_region)

secret_name_list: list[str] = secretsmanager.get_secret_list(client)
filtered_secret_name_list: list[str] | None = utils.get_filtered_str_list(
    secret_name_list)
secretsmanager.delete_secret_list(client, filtered_secret_name_list)

print("\npercy end")
