<!-- Elastic Compute Cloud (EC2) -->

Used as an ECS launch type.
Virtual machines in cloud that provide computing capacities for softwares.

<!-- Terms -->

* Instance - Virtual server (virtual computing env).

* Instance Types - CPU, memory, storage, network capacity (change on the fly).

* Instance Store Volumes - Storage for temp data of instances.

# Coupling Services

* EC2 Block Storage (EBS) - Storing data on virtual drives.

* EC2 File System (EFS) - Managed network file system

* EC2 Load Balancer (ELS) - Distributing load across machines.

* Auto Scaling Group (ASG) - Scaling the services.

<!-- Operation -->

# Configs

* OS - Linux; Windows; MacOS;
* CPU - Compute power & cores
* RAM - Random-access memory
* Storage Space - Network attached (EBS & EFS) or hardware (EC2 Instance Store)
* Network Card - Speed of the card, Public IP address
* Firewall Rules - Security group
* Bootstrapping - Launching commands when a machine starts.
* EC2 User Data - A script to bootstrap the instances, only ran once at the instance first start, automate boot tasks such as installing updates, installing software, downloading common files, ...

<!-- Performance -->

# Instance Types

Balance between compute, memory, and networking.

## Compute Optimized

Great for compute-intensive tasks that require high performance processors.

* Batch processing workloads
* Media transcoding
* High performance web servers
* High performance computing (HPC)
* Scientific modeling & machine learning
* Dedicated gaming servers

## Memory Optimized

Fast performance for workloads that process large data sets in memory

* High performance, relational/non-relational databases
* Distributed web scale cache stores
* In-memory databases optimized for BI (business intelligence)
* Applications performing real-time processing of big unstructured data

## Storage Optimized

Great for storage-intensive tasks that require high, sequential read and write access to large data sets on local storage.

* High frequency online transaction processing (OLTP) systems
* Relational & NoSQL databases
* Cache for in-memory databases (for example, Redis)
* Data warehousing applications
* Distributed file systems

<!-- Pricing -->

# Purchasing Options

* On-Demand Instances – short workload, predictable pricing, pay by second
* Reserved (1 & 3 years)
* Reserved Instances – long workloads
* Convertible Reserved Instances – long workloads with flexible instances
* Savings Plans (1 & 3 years) –commitment to an amount of usage, long workload
* Spot Instances – short workloads, cheap, can lose instances (less reliable)
* Dedicated Hosts – book an entire physical server, control instance placement
* Dedicated Instances – no other customers will share your hardware
* Capacity Reservations – reserve capacity in a specific AZ for any duration

<!-- Security -->

# Security Group (SG)

Control how traffic is allowed into or out of EC2 instances.

* Only contain "allow" rules.
* Rules can reference by IP or by other SGs.
* Can be attached to multiple instances.
* Locked down to a region/VPC combination.

## Regulations

* Access to ports
* Authorized IP ranges (IPv4 & IPv6)
* Control of inbound network (blocked by default)
* Control of outbound network (authorized by default)

## Classic Ports

* 22 - SSH (secure shell) - log into a Linux instance
* 21 - FTP (file transfer protocol) - upload files into a file share
* 22 - SFTP (secure file transfer protocol) - upload files using SSH
* 80 - HTTP - access unsecured websites
* 443 - HTTPS - access secured websites
* 3389 - RDP (remote desktop protocol) - log into a Windows instance

<!-- Test -->

# Shared Responsibility Model

## AWS

* Infrastructure (global network security)
* Isolation on physical hosts
* Replacing faulty hardware
* Compliance validation

## User

* Security Groups rules
* Operating-system patches and updates
* Software and utilities installed on the EC2 instance
* IAM Roles assigned to EC2 & IAM user access management
* Data security on your instance
