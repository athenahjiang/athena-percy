# Container Metrics (App Related)

## Running Containers
count(container_last_seen{image!="",name=~".+eligsvc-container.+",deployment_id="$deployment_num"})

## CPU Usage
{{name}}
rate(container_cpu_user_seconds_total{image!="",name=~".+eligsvc-container.+",deployment_id="$deployment_num"}[$interval]) * 100

## Memory Usage
{{name}}
container_memory_usage_bytes{image!="",name=~".+eligsvc-container.+",deployment_id="$deployment_num"}

# Container Metrics (Other)

## Running Containers
count(container_last_seen{image!="",name!~".+eligsvc-container.+",deployment_id="$deployment_num"})

## CPU Usage
{{name}}
rate(container_cpu_user_seconds_total{image!="",name!~".+eligsvc-container.+",deployment_id="$deployment_num"}[$interval]) * 100

## Memory Usage
{{name}}
container_memory_usage_bytes{image!="",name!~".+eligsvc-container.+",deployment_id="$deployment_num"}
