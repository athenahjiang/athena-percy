<!-- Event Bridge -->

Serverless event bus for SaaS apps and AWS services

<!-- Terms -->

* Event Source - AWS services, custom apps, SaaS apps

* Event - A JSON object sent to an Event Bus or Pipe.

* Event Bus - Routers that receive events and deliver them to zero or more targets (many sources to many targets).

* Event Pipe - Each pipe receives events from a single source for processing and delivery to a single target.

* Rule - Receives incoming events and sends them as appropriate to targets for processing.

* Event Pattern - Contains one or more filters like event metadata, event data, or event contents to match events.

* Target - A resource or endpoint that receives the event when it matches the event pattern defined for a rule.

<!-- Operation -->

# Workflow

Event Source -> Event Bus/Pipe -> Event -> Rule -> Target

# Event

Amazon EC2 generates an event when the state of an instance changes from pending to running.

Amazon EC2 Auto Scaling generates events when it launches or terminates instances.

AWS CloudTrail publishes events when you make API calls.

https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-service-event-list.html

# Target

https://docs.aws.amazon.com/eventbridge/latest/userguide/eb-targets.html

<!-- Performance -->

<!-- Pricing -->

<!-- Security -->
