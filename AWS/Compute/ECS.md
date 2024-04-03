<!-- Elastic Container Service (ECS) -->

Configs that manages Docker containers on a cluster of EC2 or Fargate instances.

<!-- Terms -->

* Task - Running container defined by task definition, an "instance" of task definition.

* Task Definition - Blueprint that describes how a docker container should launch.

* Service (Task Template) - Defines long running tasks of the same task definition.

* Cluster - Logic group of instances. The ecs-agent software on the server registers the instance to an ecs cluster.

* Container Instance - An instance that is part of an ecs cluster that has docker container and the ecs-agent running on it.

# Layer

* Capacity - The infra where containers run (ec2 or fargate)

* Controller - Deploy and manage applications that run on the containers (scheduler)

* Provisioning - The tools that interface with the controller (ecs) (console,cli,sdk)

<!-- Operation -->

# Task Placement

Supports tasks that use EC2 as launch type (does not support Fargate)
ECS determines which instances to place the tasks and which tasks to terminate

## Steps

1. Identify the instances that satisfy the task definition (CPU,GPU,memory).
2. Identify the instances that satisfy the task placement constraints.
3. Identify the instances that satisfy the task placement strategies.
4. Select the instances for task placement.

## Task Placement Constraints

A rule that is considered during task placement. At least one container instance must match the constraint, if there are no instances that match the constraint, the task remains in a PENDING state. There are no default constraints.

### Constraint Types

* distinctInstance - Place each task on a different container instance.
* memberOf - Place tasks on container instances that satisfy an expression.

### Constraint Attributes

* ecs.ami-id
* ecs.availability-zone
* ecs.instance-type
* ecs.os-type
* ecs.os-family
* ecs.cpu-architecture
* ecs.vpc-id
* ecs.subnet-id

## Task Placement Strategies

An algorithm for selecting instances for task placement or tasks for termination.

* Default - Spread using the attribute:ecs.availability-zone.

* Random - Tasks are placed randomly.

* Spread - Tasks are placed evenly based on the specified value (like instance id, host, or availability zone). When scaling in, ECS selects tasks to terminate that maintain a balance across availability zones, within an availability zone, tasks are selected at random.

* Binpack - To leave the least amount of unused CPU or memory in order to minimize the number of container instances in use. When scaling in, ECS terminates tasks based on the amount of resources left on the container instance after the task is terminated. A task will be terminated if terminating it will have the most available resources left.

<!-- Performance -->

<!-- Pricing -->

<!-- Security -->
