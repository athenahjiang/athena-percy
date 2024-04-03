<!-- node -->

# up (ec2 nodes) (value=0/1,up/down)
{
	deployment_id="8b0956-dev", <!-- query -->
	host="i-08a268f0758ab3bec",
	instance="10.137.135.11",
	instance_type="t3a.large",
	job="ec2-instance-metrics",
	service_name="eligsvc", <!-- query -->
	tag_Name="eligsvc-8b0956-dev-app" <!-- data: app/logging -->
}

# memory

## mem_available, mem_buffered, mem_cached (value=bytes)
{
	availability_zone="us-east-1a",
	cluster="ECSInstance",
	deployment_id="8b0956-dev", <!-- query -->
	exported_host="i-0c14a8f251face0c8",
	host="i-0c14a8f251face0c8",
	instance="10.137.132.238", <!-- data: instance ip -->
	instance_type="t3.large", <!-- data: instance type -->
	job="ec2-instance-metrics",
	region="us-east-1",
	service_name="eligsvc", <!-- query -->
	tag_Name="eligsvc-8b0956-dev-app" <!-- data: app/logging -->
}

# cpu

## cpu_usage_idle (value=%)
{
	availability_zone="us-east-1a",
	cluster="ECSInstance",
	cpu="cpu-total", <!-- query -->
	deployment_id="8b0956-dev", <!-- query -->
	exported_host="i-0c14a8f251face0c8",
	host="i-0c14a8f251face0c8",
	instance="10.137.132.238", <!-- data: instance ip -->
	instance_type="t3.large", <!-- data: instance type -->
	job="ec2-instance-metrics", <!-- query -->
	region="us-east-1",
	service_name="eligsvc", <!-- query -->
	tag_Name="eligsvc-8b0956-dev-app"
}

# system load
system_load1{service_name="[[service_name]]",deployment_id="[[deployment_id]]"}
system_load5{service_name="[[service_name]]",deployment_id="[[deployment_id]]"}
system_load15{service_name="[[service_name]]",deployment_id="[[deployment_id]]"}

# network usage
rate(net_bytes_sent{service_name="[[service_name]]",deployment_id="[[deployment_id]]"}[30s])
rate(net_bytes_recv{service_name="[[service_name]]",deployment_id="[[deployment_id]]"}[30s])
rate(net_bytes_recv{service_name="[[service_name]]",deployment_id="[[deployment_id]]",interface="eth0"}[30s]) * 8

# disk usage
disk_free{service_name="[[service_name]]",deployment_id="[[deployment_id]]"}
disk_used_percent{service_name="[[service_name]]",deployment_id="[[deployment_id]]"}
disk_total{service_name="[[service_name]]",deployment_id="[[deployment_id]]"}
disk_inodes_used{service_name="[[service_name]]",deployment_id="[[deployment_id]]"}
disk_inodes_total{service_name="[[service_name]]",deployment_id="[[deployment_id]]"}

# diskio
irate(diskio_read_bytes{service_name="[[service_name]]",deployment_id="[[deployment_id]]"}[30s])
irate(diskio_write_bytes{service_name="[[service_name]]",deployment_id="[[deployment_id]]"}[30s])
