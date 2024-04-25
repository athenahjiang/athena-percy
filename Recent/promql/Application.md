# Application

## CPU Usage (processors)
sum by (task_name) (process_cpu_usage{deployment_id="$deployment_num"})

## Java Heap Usage (bytes)
sum by (container_arn) (jvm_memory_used_bytes{area="heap",deployment_id="$deployment_num"})
