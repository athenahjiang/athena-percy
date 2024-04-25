# Persistence Functions

## Throughput Per Interval (requests)
sum by (method) (increase(method_timed_seconds_count{deployment_id="$deployment_num",class=~"com.athenahealth.collector.fdp.eligibility.dao.+"}[$interval])) != 0

## Errors Per Interval (count)
sum by (method) (increase(method_timed_seconds_count{deployment_id="$deployment_num",class=~"com.athenahealth.collector.fdp.eligibility.dao.+",exception!~"none"}[$interval])) != 0

## Average Latency Per Interval (seconds)
sum by (method) (rate(method_timed_seconds_sum{deployment_id="$deployment_num",class=~"com.athenahealth.collector.fdp.eligibility.dao.+"}[$interval])) != 0 / sum by (method) (rate(method_timed_seconds_count{deployment_id="$deployment_num",class=~"com.athenahealth.collector.fdp.eligibility.dao.+"}[$interval])) != 0

## Maximum Latency Per Interval (seconds)
max by (method) (method_timed_seconds_max{deployment_id="$deployment_num",class=~"com.athenahealth.collector.fdp.eligibility.dao.+"}) != 0

## 95% Quantile Latency Per Interval (seconds)
avg by (method) (method_timed_seconds{deployment_id="$deployment_num",class=~"com.athenahealth.collector.fdp.eligibility.dao.+",quantile="0.95"}) != 0
