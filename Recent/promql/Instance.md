# Instance

## Up
up{job="ec2-instance-metrics",service_name="eligsvc",deployment_id=~"$deployment_num.+"}

## CPU Usage
100 - cpu_usage_idle{job="ec2-instance-metrics",cpu="cpu-total",service_name="eligsvc",deployment_id=~"$deployment_num.+"} != 0

## Memory Usage
{{tag_Name}} {{instance}}
mem_available{job="ec2-instance-metrics",service_name="eligsvc",deployment_id=~"$deployment_num.+"} != 0
mem_buffered{job="ec2-instance-metrics",service_name="eligsvc",deployment_id=~"$deployment_num.+"} != 0
mem_cached{job="ec2-instance-metrics",service_name="eligsvc",deployment_id=~"$deployment_num.+"} != 0
