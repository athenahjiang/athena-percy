<!-- prometheus -->

# links

## eligsvc
https://prometheus-eligibility.us-east-1.dev.eligibility.aws.athenahealth.com/graph
https://prometheus-eligibility.us-east-1.prod.eligibility.aws.athenahealth.com/graph

<a logs>
http://localhost:8080/actuator/prometheus
https://eligibility.dev.api.athena.io/eligibility-service/actuator/prometheus

## icic
https://prometheus.us-east-1.dev.patientinsurance.aws.athenahealth.com/graph
https://prometheus.us-east-1.prod.patientinsurance.aws.athenahealth.com/graph

# terms

## data model (time series)
streams of timestamped values 
belonging to the same metric and same set of labeled dimensions

## metrics
time series data stored with the timestamp at which it was recorded

<a counter>
cumulative
single monotomically increasing counter
value can only increase or be reset to zero on restart

<a gauge>
cumulative
single numerical value that can arbitrarily go up and down
like number of concurrent requests or current memory usage

<a histogram & summary>
not cumulative
samples observations and counts them in configurable buckets
for things like request durations or response sizes
exposed like basename_bucket, basename_sum, basename_count, basename_quantile

## name
normally means metric name

## labels
optional key-value pairs stored alongside with metrics

<a auto generated>
job: the configured job name that the target belongs to
instance: the host:port part of the target URL that was scraped

## target
where metrics come from
an object to scrape

## instance
an endpoint you can scrape
usually corresponding to a single process

## job
a collection of instances with the same purpose

<a scrape-container-metrics (cadvisor)>
cAdvisor (short for container Advisor)
analyzes and exposes resource usage and performance data from running containers

## components
<a main Prometheus server> scrapes and stores time series data
<a client libraries> instrumenting application code
<a push gateway> supporting short-lived jobs
<a exporters> for services like HAProxy, StatsD, Graphite, ...
<a alertmanager> handle alerts

# yaml

## global
<a scrape_interval> how often prom scrape targets
<a evaluation_interval> how often prom evaluate rules

## rule_files
location of rules for prom server to load

## scrape_configs
what resources prom monitors

<a prometheus>
prom exposes data about itself as an HTTP endpoint
scrape and monitor its own health

# rules
rules within a group are run sequentially at a regular interval

## recording rules
precompute frquentely needed or computationally expensive expressions
save their result as a new set of time series
especially useful for dashboards
must be valid metric names

## alerting rules
must be valid label values
