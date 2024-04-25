# Bus Calls

## Throughput Per Interval (requests)
sum by (endpoint) (increase(buscall_for_object_seconds_count{deployment_id="$deployment_num"}[$interval])) != 0

## Errors Per Interval (count)
sum by (endpoint) (increase(buscall_for_object_seconds_count{deployment_id="$deployment_num",exception!~"none"}[$interval])) != 0

## Average Latency Per Interval (seconds)
sum by (endpoint) (rate(buscall_for_object_seconds_sum{deployment_id="$deployment_num"}[$interval])) != 0 / sum by (endpoint) (rate(buscall_for_object_seconds_count{deployment_id="$deployment_num"}[$interval])) != 0

## Maximum Latency Per Interval (seconds)
max by (endpoint) (buscall_for_object_seconds_max{deployment_id="$deployment_num"}) != 0

## 95% Quantile Latency Per Interval (seconds)
avg by (endpoint) (buscall_for_object_seconds{deployment_id="$deployment_num",quantile="0.95"}) != 0
