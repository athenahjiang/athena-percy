<!-- Step Functions -->

Coordinate app components in a visual workflow.
Build and run state machines to execute app steps.

<!-- Terms -->

* State Machine - A workflow, a series of event-driven steps.

* State - Each step in a workflow.

* Task - A state, representing a unit of work performed by another AWS service.

* Execution - An instance of a running workflow.

<!-- Operation -->

<!-- Performance -->

# Workflows

## Standard Workflows

Have exactly-once workflow execution and can run for up to one year. 
This means that each step in a Standard workflow will execute exactly once.
Ideal for long-running, auditable workflows, as they show execution history and visual debugging.

* 2,000 per second execution rate
* 4,000 per second state transition rate
* Priced by state transition
* Show execution history and visual debugging
* Support all service integrations and patterns

## Express Workflows

Have at-least-once workflow execution and can run for up to five minutes.
This means that one or more steps in an Express Workflow can potentially run more than once, while each step in the workflow executes at least once.
Ideal for high-event-rate workloads, such as streaming data processing and IoT data ingestion.

* 100,000 per second execution rate
* Nearly unlimited state transition rate
* Priced by number and duration of executions
* Send execution history to Amazon CloudWatch
* Show execution history and visual debugging based on the Log level enabled
* Support all service integrations and most patterns

<!-- Pricing -->

<!-- Security -->
