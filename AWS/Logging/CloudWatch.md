<!-- CloudWatch -->

Monitors AWS resources and applications

<!-- Terms -->

* Events - Indicates change in AWS environment, resources generate events when their state changes.

* Rules - Matches and routes incoming events to targets, modifies event JSON. A single rule can route to multiple targets processed in parallel but not processed in particular order.

* Targets - Processes events, receives events in JSON format.

* Logs - Centralized logging for all AWS. Can run query, can configure retention range, can be archived.

<!-- Operation -->

# Related Services

* SNS - Send messages to subscribers when an alarm threshold has been reached.

* EC2 Auto Scaling - Automatically launch or terminate EC2 instances based on health status checks or alarm thresholds.

* CloudTrail - Monitors the calls made to the CloudWatch API.

# Qualifies as Events

EC2 instances; Lambda functions; CloudWatch logs; ECS tasks; Step Functions state machines; SNS topics; SQS queues;

<!-- Performance -->

<!-- Pricing -->

<!-- Security -->
