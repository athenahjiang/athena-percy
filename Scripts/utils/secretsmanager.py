import variables


def get_secret_list(client) -> list:
    secret_list: list = client.list_secrets(
        IncludePlannedDeletion=False,
        Filters=[{'Key': 'name', 'Values': [variables.prefix_rds]}],
        MaxResults=variables.max_results
    )['SecretList']
    secret_name_list: list[str] = [secret['Name'] for secret in secret_list]
    print("\npercy: secret name list: length: ", len(secret_name_list))
    return secret_name_list


def delete_secret_list(client, secret_name_list: list[str] | None) -> None:
    print(f"\npercy: started deleting secrets: ")
    if secret_name_list is None:
        print("percy: secret_name_list is None")
        return
    if len(secret_name_list) == 0:
        print("percy: secret_name_list is empty")
        return

    for secret_name in secret_name_list:
        print("\npercy: secret name: ", secret_name)
        try:
            client.remove_regions_from_replication(
                SecretId=secret_name, RemoveReplicaRegions=[variables.replica_region])
            client.delete_secret(SecretId=secret_name,
                                 ForceDeleteWithoutRecovery=True)
            print("percy: secret deleted")
        except (client.exceptions.ResourceNotFoundException, client.exceptions.InvalidRequestException, client.exceptions.InvalidParameterException, client.exceptions.DecryptionFailure, client.exceptions.InternalServiceError) as e:
            print("percy: e: ", e)
            continue
