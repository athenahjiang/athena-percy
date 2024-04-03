import boto3
import variables
import utils.ecs as ecs
import utils.utils as utils

print("percy: start")
print("percy: primary_region: ", variables.primary_region)
print("percy: replica_region: ", variables.replica_region)

client = boto3.session.Session().client(service_name='ecs',
                                        region_name=variables.primary_region)

task_def_prefix_list: list[str] = ecs.get_task_def_prefix_list(client)
filtered_task_def_prefix_list: list[str] | None = utils.get_filtered_str_list(
    task_def_prefix_list)
ecs.deregister_task_def_prefix_list(client, filtered_task_def_prefix_list)

print("\npercy end")
