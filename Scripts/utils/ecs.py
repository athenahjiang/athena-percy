import variables
import utils.utils as utils


def get_task_def_prefix_list(client) -> list[str]:
    task_def_prefix_list = client.list_task_definition_families(
        familyPrefix=variables.service_short_name,
        status=variables.ecs_task_def_status,
        maxResults=variables.max_results
    )['families']
    print("\npercy: task definition prefix list: length: ",
          len(task_def_prefix_list))
    return task_def_prefix_list


def get_task_def_arn_list(client, prefix: str) -> list[str]:
    task_def_arn_list: list = client.list_task_definitions(
        familyPrefix=prefix,
        status=variables.ecs_task_def_status,
        maxResults=variables.max_results,
        sort=variables.sort
    )['taskDefinitionArns']
    return task_def_arn_list


def deregister_task_def_prefix_list(client, task_def_prefix_list: list[str]) -> None:
    print(f"\npercy: started deregistering task definitions: ")
    if task_def_prefix_list is None:
        print("percy: task_def_prefix_list is None")
        return
    if len(task_def_prefix_list) == 0:
        print("percy: task_def_prefix_list is empty")
        return

    for task_def_prefix in task_def_prefix_list:
        print("\npercy: task_def_prefix name: ", task_def_prefix)
        task_def_arn_list: list[str] = get_task_def_arn_list(
            client, task_def_prefix)

        for task_def_arn in task_def_arn_list:
            print("percy: task_def_arn: ", task_def_arn)
            try:
                client.deregister_task_definition(taskDefinition=task_def_arn)
                print("percy: task definition deregistered")
            except (client.exceptions.ResourceNotFoundException, client.exceptions.InvalidRequestException, client.exceptions.InvalidParameterException, client.exceptions.DecryptionFailure, client.exceptions.InternalServiceError, client.exceptions.ThrottlingException) as e:
                print("percy: e: ", e)
                continue

        try:
            chunk_list: list[list[str]] = utils.chunk_list(
                task_def_arn_list, 10)
            for chunk in chunk_list:
                client.delete_task_definitions(taskDefinitions=chunk)
                print("percy: task definitions deleted: ", len(chunk))
        except (client.exceptions.ResourceNotFoundException, client.exceptions.InvalidRequestException, client.exceptions.InvalidParameterException, client.exceptions.DecryptionFailure, client.exceptions.InternalServiceError, client.exceptions.ThrottlingException) as e:
            print("percy: e: ", e)
            continue
