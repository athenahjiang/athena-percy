primary_region: str = "us-east-1"
replica_region: str = "us-west-2" if primary_region == "us-east-1" else "us-east-1"

sort: str = 'asc'
max_results: int = 100
deployment_id_exclude_list: list[str] | None = ["eb92cc", "947726", "percya"]
deployment_id_include_list: list[str] | None = None

datafabric_prefix: str = "iac/datafabric"
db_environment: str = "development"
db_name: str = "eligsvcdb"
pod: str = "aws-root-nonprod-0088"
service_name: str = "eligibility-service"
service_short_name: str = "eligsvc"
keyword: str = "elig"

# rds
prefix_rds: str = f"{datafabric_prefix}/{db_environment}/{pod}/{db_name}"
prefix_aurora: str = f"{
    datafabric_prefix}/{db_environment}/{pod}/{service_name}-aurora"

# ecs
ecs_task_def_status: str = "INACTIVE"
