<!-- Elastic Load Balancing (ELB) -->

Automatically distributes incoming traffic in multiple AZs across multiple targets like EC2 instances, containers, and IP addresses.
Monitors the health of registered targets and routes traffic only to the healthy ones.

<!-- Terms -->

# Types

* Application Load Balancer (HTTP/HTTPS only) - layer 7
* Network Load Balancer (high performance for TCP) - layer 4
* Gateway Load Balance (route traffic to firewalls on EC2 instances) - layer 3

# Load Balancer

Servers that forward internet traffic to multiple servers downstream.

<!-- Operation -->

<!-- Performance -->

<!-- Pricing -->

<!-- Security -->

<!-- Test -->

# Why Load Balancer

* Spread load across multiple downstream instances.
* Expose a single point of access (DNS) to your application.
* Seamlessly handle failures of downstream instances.
* Do regular health checks to your instances.
* Provide SSL termination (HTTPS) for your websites.
* High availability across zones.

# Why ELB

* AWS guarantees that it will be working.
* AWS takes care of upgrades, maintenance, high availability.
* AWS provides only a few configuration knobs.
