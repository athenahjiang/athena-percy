<!-- Auto Scaling -->

Scale multiple resources to meet demand.

<!-- Terms -->

# Scalability

## Vertical

Increasing the size of the instance. Implies non distributed systems such as database. For example, if app runs on t2.medium, scaling up means run it on t2.large, scaling down means run it on t2.small.

## Horizontal (Elastic)

Increasing the number of instances. Implies distributed systems. For example, if app runs on 2 instances, scaling out means run it on 4 instances, scaling in means run it on 1 instance.

* High Availability - Running app in at least 2 AZs to survive data center loss.

# Auto Scaling (Plan, Policy, or Option)

## Maintain current instance levels at all times

Perform periodic health check on running instances in group, if an instance is unhealthy, terminate it and launch another to replace it.

## Scale based on a schedule

Scaling actions are performed automatically at time and date. You can create a schedule scale action with only desired capacity specified, sometimes you must include min and max to ensure the new desired capacity is not outside of these.

## Scale based on demand (dynamic scaling)

Tracks a specific CloudWatch metric and defines what action to take when the associated CloudWatch alarm is in ALARM. 
The metrics that invoke the alarm are an aggregation of metrics from all instances. (If one instance has CPU at 40% and the other at 60%, 50% will be alarm metric.) 
Adjusts group capacity when the threshold of an alarm is breached.

* Target Tracking Scaling - Scale based on CloudWatch metric and a target value.

* Step Scaling - Scale based on a set of scaling adjustments that vary based on the size of alarm breach.

* Simple Scaling - Scale based on a single scaling adjustment, with a cooldown period between each scaling activity.

## Scale manually

Specify change in max, min, or desired capacity of group, then create or terminate instances to maintain the updated capacity.

## Use predictive scaling

Increase capacity in advance of daily patterns in traffic flows. Uses machine learning to predict future traffic ahead of time.

<!-- Operation -->

# ECS Cluster Auto Scaling

ECS can manage the scaling of Amazon EC2 instances that are registered to the cluster.
Uses ECS Auto Scaling Group Capacity Provider with Managed Scaling turned on.
Set the targetCapacity for the utilization of the instances in this ASG.

# Resources

## EC2 (Auto Scaling Group - ASG)

Launch or terminate EC2 instances by increasing or decreasing the desired capacity of an Auto Scaling group.
Logical collection of EC2 Instances.
Starts by launching enough instances to meet desired capacity.

* Min Capacity - EC2 instance count never goes below.
* Max Capacity - EC2 instance count never goes above.
* Desired Capacity - EC2 instance exact count.
* Event (Scaling Action) - Instructs ASG to launch or terminate EC2 instances.

## ECS

Increase or decrease the desired task count in ECS.
Implemented through the Application Auto Scaling service.

## Aurora

Increase or decrease the number of Aurora read replicas that are provisioned for an Aurora DB cluster.

<!-- Performance -->

<!-- Pricing -->

<!-- Security -->

<!-- Test -->

# Terms

* Scalability - Ability to accomodate a larger load (either vertical or horizontal).
* Elasticity - System can auto scale based on the load. This is cloud-friendly, pay-per-use, match demand, and optimize costs.
* Agility - Reduce the time to make IT resources available to developers.
