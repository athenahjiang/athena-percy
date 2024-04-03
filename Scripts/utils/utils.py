import variables


def is_resource_related(resource_name: str) -> bool:
    return variables.keyword in resource_name


def is_resource_in_deployment_id_list(resource_name: str, deployment_id_list: list[str]) -> bool:
    for deployment_id in deployment_id_list:
        if deployment_id in resource_name:
            return True
    return False


def get_filtered_str_list(str_list: list[str]) -> list[str] | None:
    filtered_list: list | None = None

    if variables.deployment_id_exclude_list is None and variables.deployment_id_include_list is None:
        filtered_list = str_list
    elif variables.deployment_id_exclude_list is not None:
        filtered_list = list(filter(lambda s: not is_resource_in_deployment_id_list(
            s, variables.deployment_id_exclude_list), str_list))
    elif variables.deployment_id_include_list is not None:
        filtered_list = list(filter(lambda s: is_resource_in_deployment_id_list(
            s, variables.deployment_id_include_list), str_list))

    if filtered_list is not None:
        print(f"\npercy: filtered resource name list: length: ", len(filtered_list))
        for s in filtered_list:
            print("percy: resource name: ", s)

    return filtered_list


def chunk_list(lst: list, n: int):
    for i in range(0, len(lst), n):
        yield lst[i:i + n]
