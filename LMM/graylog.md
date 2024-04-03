<!-- graylog -->

# links

## eligsvc
https://graylog.us-east-1.dev.eligibility.aws.athenahealth.com/search
https://graylog.us-east-1.prod.eligibility.aws.athenahealth.com/search

## icic
https://graylog.us-east-1.dev.patientinsurance.aws.athenahealth.com/search
https://graylog.us-east-1.prod.patientinsurance.aws.athenahealth.com/search

## apigateway
https://graylog-apigateway.dev.api.athena.io/streams
https://graylog-apigateway.api.athena.io/streams

# query
key:value
AND; OR; <!-- must cap -->
/- <!-- - needs to be escaped -->

## source logs
message:"DEBUG"
message:"checkEligibility()"
timestamp:"2022-11-10 06:39:25.000"

## prometheus logs
tag:fallthrough.eligibility/-service
application:eligibility/-service
environment:dev
level:1
facility:fluentd
deployment_id:e93a6f-dev

## apigateway
host:eligibility.int.api.athena.io AND message:"eligibility-service/api/v1/eligibility"
host:eligibility.api.athena.io AND message:"eligibility-service/api/v1/eligibility"
host:patient\-insurance.dev.api.athena.io
host:patient\-insurance.api.athena.io
