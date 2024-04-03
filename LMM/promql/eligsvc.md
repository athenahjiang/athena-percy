<!-- eligsvc -->

# Eligibility Endpoints

## Throughput Per Interval (requests)
sum by (uri) (increase(http_server_requests_seconds_count{task_name="eligsvc-$deployment_id-app-svc",uri=~"/api/v[0-9]+/eligibility/.+"}[$interval]))!= 0

## Errors Per Interval (count)
sum by (uri, status) (increase(http_server_requests_seconds_count{task_name="eligsvc-$deployment_id-app-svc",uri=~"/api/v[0-9]+/eligibility/.+",status!~"20[0-9]"}[$interval])) != 0

## Average Latency Per Interval (seconds)
sum by (uri) (rate(http_server_requests_seconds_sum{task_name="eligsvc-$deployment_id-app-svc",uri=~"/api/v[0-9]+/eligibility/.+"}[$interval])) != 0 / sum by (uri) (rate(http_server_requests_seconds_count{task_name="eligsvc-$deployment_id-app-svc",uri=~"/api/v[0-9]+/eligibility/.+"}[$interval])) != 0

## Maximum Latency Per Interval (seconds)
max by (uri) (http_server_requests_seconds_max{task_name="eligsvc-$deployment_id-app-svc",uri=~"/api/v[0-9]+/eligibility/.+"}) != 0

## 95% Quantile Latency Per Interval (seconds)
avg by (uri) (http_server_requests_seconds{task_name="eligsvc-$deployment_id-app-svc",uri=~"/api/v[0-9]+/eligibility/.+",quantile="0.95"}) != 0

# Bus Calls

## Throughput Per Interval (requests)
sum by (endpoint) (increase(buscall_for_object_seconds_count{task_name="eligsvc-$deployment_id-app-svc"}[$interval])) != 0

## Errors Per Interval (count)
sum by (endpoint) (increase(buscall_for_object_seconds_count{task_name="eligsvc-$deployment_id-app-svc",exception!~"none"}[$interval])) != 0

## Average Latency Per Interval (seconds)
sum by (endpoint) (rate(buscall_for_object_seconds_sum{task_name="eligsvc-$deployment_id-app-svc"}[$interval])) != 0 / sum by (endpoint) (rate(buscall_for_object_seconds_count{task_name="eligsvc-$deployment_id-app-svc"}[$interval])) != 0

## Maximum Latency Per Interval (seconds)
max by (endpoint) (buscall_for_object_seconds_max{task_name="eligsvc-$deployment_id-app-svc"}) != 0

## 95% Quantile Latency Per Interval (seconds)
avg by (endpoint) (buscall_for_object_seconds{task_name="eligsvc-$deployment_id-app-svc",quantile="0.95"}) != 0

# application

## CPU Usage (processors)
sum by (task_name) (process_cpu_usage{task_name="eligsvc-$deployment_id-app-svc"})
process_cpu_usage{task_name="eligsvc-$deployment_id-app-svc"}

## Java Heap Usage (bytes)
sum by (task_name) (jvm_memory_used_bytes{area="heap", task_name="eligsvc-$deployment_id-app-svc"})
sum by (container_arn) (jvm_memory_used_bytes{area="heap", task_name="eligsvc-$deployment_id-app-svc"})

# Container Metrics (App Related)

## Running Containers
count(container_last_seen{image!="",service_name="eligsvc",container_label_deployment_id="$deployment_id"})

## CPU Usage
rate(container_cpu_user_seconds_total{image!="",service_name="eligsvc",container_label_deployment_id="$deployment_id"}[$interval]) * 100

## Memory Usage
container_memory_usage_bytes{image!="",service_name="eligsvc",container_label_deployment_id="$deployment_id"}

# Container Metrics (Other)

## Running Containers
count(container_last_seen{image!="",service_name="eligsvc",deployment_id="$deployment_num",container_label_deployment_id!="$deployment_id"})

## CPU Usage
rate(container_cpu_user_seconds_total{image!="",service_name="eligsvc",deployment_id="$deployment_num",container_label_deployment_id!="$deployment_id"}[$interval]) * 100

## Memory Usage
container_memory_usage_bytes{image!="",service_name="eligsvc",deployment_id="$deployment_num",container_label_deployment_id!="$deployment_id"}

# Instance

## Up
up{job="ec2-instance-metrics",service_name="eligsvc",deployment_id="$deployment_id"}

## CPU Usage
100 - cpu_usage_idle{job="ec2-instance-metrics",cpu="cpu-total",service_name="eligsvc",deployment_id="$deployment_id"} != 0

## Memory Usage
{{tag_Name}} {{instance}}
mem_available{job="ec2-instance-metrics",service_name="eligsvc",deployment_id="$deployment_id"} != 0
mem_buffered{job="ec2-instance-metrics",service_name="eligsvc",deployment_id="$deployment_id"} != 0
mem_cached{job="ec2-instance-metrics",service_name="eligsvc",deployment_id="$deployment_id"} != 0

# variables

## deployment_id
label_values(up{job="ec2-instance-metrics",service_name="eligsvc"}, deployment_id)

## deployment_num
label_values(container_last_seen{image!="",service_name="eligsvc",deployment_id!="",container_label_deployment_id=""}, deployment_id)
