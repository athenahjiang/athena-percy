<!-- Elastic Block Store (EBS) -->

Block level storage volumes for EC2.

<!-- Terms -->

<!-- Operation -->

# Usage

EBS is a network drive that can be attached to EC2 instances while they run.

* It can be detached from an EC2 instance and attached to another one quickly.
* Allows EC2 instances to persist data even after their termination.
* Can only be mounted to one instance at a time.
* Bound to a specific AZ. To move a volume across AZ, a snapshot needs to be taken first.
* Have a provisioned capacity (billed for the provisioned capacity) but can be increased over time.

# Snapshot

A backup of EBS volume.

* Detaching volume to do snapshot is recommended.
* Can be copied across AZ or region.
* Archiving - Move snapshot to an "archive tier" that is 75% cheaper. Restoring from archive takes 24 to 72 hours.
* Recycling - Setup rules (specify retention) to retain deleted snapshots to recycle bin so they can be recovered after an accidental deletion.

# Amazon Machine Image (AMI)

Customization of an EC2 instance built for a specific region.

* Public AMI - AWS provided.
* Own AMI - User make and maintain (add own software, OS, configs, monitoring, ...).
* Market AMI - Someone else made and potentially sells.

<!-- Performance -->

<!-- Pricing -->

<!-- Security -->

<!-- Test -->

# Shared Responsibility Model

## AWS

* Infrastructure
* Replication for data for EBS volumes & EFS drives
* Replacing faulty hardware
* Ensuring their employees cannot access your data

## User

* Setting up backup / snapshot procedures
* Setting up data encryption
* Responsibility of any data on the drives
* Understanding the risk of using EC2 Instance Store
