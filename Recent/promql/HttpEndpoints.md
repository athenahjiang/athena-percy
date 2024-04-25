# Http Endpoints

## Throughput Per Interval (requests)
sum by (uri) (increase(http_server_requests_seconds_count{deployment_id="$deployment_num",uri=~"/api/v[0-9]+/eligibility/.+"}[$interval])) != 0

## Errors Per Interval (count)
sum by (uri, status) (increase(http_server_requests_seconds_count{deployment_id="$deployment_num",uri=~"/api/v[0-9]+/eligibility/.+",status!~"20[0-9]"}[$interval])) != 0

## Average Latency Per Interval (seconds)
sum by (uri) (rate(http_server_requests_seconds_sum{deployment_id="$deployment_num",uri=~"/api/v[0-9]+/eligibility/.+"}[$interval])) != 0 / sum by (uri) (rate(http_server_requests_seconds_count{deployment_id="$deployment_num",uri=~"/api/v[0-9]+/eligibility/.+"}[$interval])) != 0

## Maximum Latency Per Interval (seconds)
max by (uri) (http_server_requests_seconds_max{deployment_id="$deployment_num",uri=~"/api/v[0-9]+/eligibility/.+"}) != 0

## 95% Quantile Latency Per Interval (seconds)
avg by (uri) (http_server_requests_seconds{deployment_id="$deployment_num",uri=~"/api/v[0-9]+/eligibility/.+",quantile="0.95"}) != 0
