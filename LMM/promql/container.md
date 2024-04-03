<!-- container -->

# cpu usage

## container_cpu_user_seconds_total/container_cpu_usage_seconds_total (value=seconds)
{
	cluster_arn="arn:aws:ecs:us-east-1:922056656510:cluster/eligsvc-8b0956-dev-app",
	container_arn="arn:aws:ecs:us-east-1:922056656510:container/eligsvc-8b0956-dev-app/20538690b17f4b53b7e58b60300224ce/3298ead5-8a3b-4dc4-8a12-92381ac3e8d0",container_label_GIT_COMMIT="df848fb1bed78847c44a4300fa57f66ff48061dc",
	container_label_GIT_URL="https://bitbucket.athenahealth.com/scm/COLTEC/eligibility-service.git",container_label_PROJECT_BRANCH="feature/COLTEC-555_ga_perf_test",container_label_PROJECT_KEY="COLTEC",container_label_PROJECT_REPO="eligibility-service",container_label_PROMETHEUS_EXPORTER_PATH="/actuator/prometheus",container_label_PROMETHEUS_EXPORTER_PORT="8080",container_label_application="eligibility-service",container_label_athenahealth_baseimage_description="CentOS7 Base Image built by DevOps for athenahealth containers.",
	container_label_athenahealth_baseimage_owner="athenahealth DevOps",
	container_label_com_amazonaws_ecs_cluster="eligsvc-8b0956-dev-app",
	container_label_com_amazonaws_ecs_container_name="eligsvc-container",
	container_label_com_amazonaws_ecs_task_arn="arn:aws:ecs:us-east-1:922056656510:task/eligsvc-8b0956-dev-app/9233db654340480da5a29be90ca63465",
	container_label_com_amazonaws_ecs_task_definition_family="eligsvc-8b0956-dev-app-svc", <!-- data -->
	container_label_com_amazonaws_ecs_task_definition_version="6",
	container_label_deployment_id="8b0956-dev",
	container_label_environment="dev",
	container_label_org_label_schema_build_date="20191024",
	container_label_org_label_schema_license="GPLv2",
	container_label_org_label_schema_name="CentOS Base Image",
	container_label_org_label_schema_schema_version="1.0",
	container_label_org_label_schema_vendor="CentOS",
	container_label_team="COLTEC",
	container_name="cadvisor_container", <!-- always same? -->
	cpu="cpu00",
	deployment_id="8b0956", <!-- query -->
	docker_image="docker-prod.artifactory.aws.athenahealth.com/athenahealth/di/docker-cadvisor_cadvisor:1.0.2",id="/ecs/9233db654340480da5a29be90ca63465/5d616c39b7d5215357a1f057391f5c6cb8a73663f47101dd80d1cba247fc4f92",
	image="docker.artifactory.aws.athenahealth.com/coltec/eligibility-service/application:feature-coltec-555-ga-perf-test-14-df848fb-20230208134201",instance="10.137.133.76:8092",
	job="scrape-container-metrics", <!-- always same? -->
	name="ecs-eligsvc-8b0956-dev-app-svc-6-eligsvc-container-a8d4f3f1cff8b1ab7a00", <!-- data -->
	service_name="eligsvc", <!-- query -->
	task_arn="arn:aws:ecs:us-east-1:922056656510:task/eligsvc-8b0956-dev-app/20538690b17f4b53b7e58b60300224ce",
	task_group="service:eligsvc-8b0956-dev-cadvisor",
	task_name="eligsvc-8b0956-dev-cadvisor",
	task_revision="1"
}
rate(container_cpu_user_seconds_total{image!="",service_name="[[service_name]]",deployment_id="[[deployment_id]]"}[5m]) * 100
rate(container_cpu_user_seconds_total{image!="",name=~".+app-svc.+",service_name="[[service_name]]",container_label_deployment_id=~"[[deployment_id]]"}[5m]) * 100

# memory usage

## container_memory_usage_bytes (value=bytes)
container_memory_usage_bytes{
	cluster_arn="arn:aws:ecs:us-east-1:922056656510:cluster/eligsvc-8b0956-dev-app",
	container_arn="arn:aws:ecs:us-east-1:922056656510:container/eligsvc-8b0956-dev-app/20538690b17f4b53b7e58b60300224ce/3298ead5-8a3b-4dc4-8a12-92381ac3e8d0",
	container_label_GIT_COMMIT="df848fb1bed78847c44a4300fa57f66ff48061dc",
	container_label_GIT_URL="https://bitbucket.athenahealth.com/scm/COLTEC/eligibility-service.git",container_label_PROJECT_BRANCH="feature/COLTEC-555_ga_perf_test",container_label_PROJECT_KEY="COLTEC",container_label_PROJECT_REPO="eligibility-service",container_label_PROMETHEUS_EXPORTER_PATH="/actuator/prometheus",container_label_PROMETHEUS_EXPORTER_PORT="8080",container_label_application="eligibility-service",container_label_athenahealth_baseimage_description="CentOS7 Base Image built by DevOps for athenahealth containers.",container_label_athenahealth_baseimage_owner="athenahealth DevOps",
	container_label_com_amazonaws_ecs_cluster="eligsvc-8b0956-dev-app",
	container_label_com_amazonaws_ecs_container_name="eligsvc-container",
	container_label_com_amazonaws_ecs_task_arn="arn:aws:ecs:us-east-1:922056656510:task/eligsvc-8b0956-dev-app/9233db654340480da5a29be90ca63465",
	container_label_com_amazonaws_ecs_task_definition_family="eligsvc-8b0956-dev-app-svc", <!-- data -->
	container_label_com_amazonaws_ecs_task_definition_version="6",
	container_label_deployment_id="8b0956-dev",
	container_label_environment="dev",
	container_label_org_label_schema_build_date="20191024",
	container_label_org_label_schema_license="GPLv2",
	container_label_org_label_schema_name="CentOS Base Image",
	container_label_org_label_schema_schema_version="1.0",
	container_label_org_label_schema_vendor="CentOS",
	container_label_team="COLTEC",
	container_name="cadvisor_container", <!-- always same? -->
	deployment_id="8b0956", <!-- query -->
	docker_image="docker-prod.artifactory.aws.athenahealth.com/athenahealth/di/docker-cadvisor_cadvisor:1.0.2",
	id="/ecs/9233db654340480da5a29be90ca63465/5d616c39b7d5215357a1f057391f5c6cb8a73663f47101dd80d1cba247fc4f92",
	image="docker.artifactory.aws.athenahealth.com/coltec/eligibility-service/application:feature-coltec-555-ga-perf-test-14-df848fb-20230208134201",
	instance="10.137.133.76:8092",
	job="scrape-container-metrics", <!-- always same? -->
	name="ecs-eligsvc-8b0956-dev-app-svc-6-eligsvc-container-a8d4f3f1cff8b1ab7a00", <!-- data -->
	service_name="eligsvc", <!-- query -->
	task_arn="arn:aws:ecs:us-east-1:922056656510:task/eligsvc-8b0956-dev-app/20538690b17f4b53b7e58b60300224ce",
	task_group="service:eligsvc-8b0956-dev-cadvisor",
	task_name="eligsvc-8b0956-dev-cadvisor",
	task_revision="1"
}
container_memory_usage_bytes{image!="",service_name="[[service_name]]",deployment_id="[[deployment_id]]"}
container_memory_usage_bytes{image!="",name=~".+app-svc.+",service_name="[[service_name]]",container_label_deployment_id="[[deployment_id]]"}

# network

## receive
irate(container_network_receive_bytes_total{image!="",service_name="[[service_name]]",container_label_deployment_id="[[deployment_id]]"}[5m])

## transmit
irate(container_network_transmit_bytes_total{image!="",service_name="[[service_name]]",container_label_deployment_id="[[deployment_id]]"}[5m])
