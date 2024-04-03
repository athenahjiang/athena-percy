<!-- Terms -->

<!-- Conceptual -->

# Cloud computing

Modularize the common demands and saturate them to a universal vendor. Save efforts with administrative overheads to focus more on personalized demands (business logics). Vendor manages the cloud while customers manage whatever is in the cloud.
*anything overly repeated, can be saturated*

# Service

* Infra as a service (iaas) - Entire pre-developed infra in cloud, platforms and softwares run on top of infra. Like AWS, only need to manage infra, still need to put platform onto infra.
* Platform as a service (paas) - Entire pre-developed platform in cloud, softwares deployed on platforms. Like Docker, only need to manage platform, still need to write software.
* Software as a service (saas) - Entire pre-developed software in cloud, contents created on softwares. Like email, only need to manage software, still need to write content.

<!-- Technical -->

* ARN - AWS Resource Number
* ASL - AWS State Language <!-- pretty much json -->
* AMI - AWS Machine Image <!-- like docker image, pretty much config file -->

# Elastic

There are 2 kinds of scalability, vertical and horizontal, elasticity means horizontal scalability.

# Access

* AWS Management Console - Protected by password + MFA (multi-factor authentication)
* AWS Command Line Interface (CLI) - Protected by access keys
* AWS Software Developer Kit (SDK) - Protected by access keys

# Availability Zone (AZ)

* Each region has 3-6 AZs
* Each AZ is one or more discrete data centers connected with networking but separated from each other so they are isolated from disasters.

# Global Services

* IAM
* Route53 (DNS Service)
* CloudFront (Content Delivery Network)
* WAF (Web Application Firewall)

# Region-Scoped Services

* EC2 (IaaS)
* Elastic Beanstalk (PaaS)
* Lambda (FaaS)
* Rekognition (SaaS)

<!-- Pricing -->

# Fundamentals

* Compute - Pay for compute time
* Storage - Pay for data stored in the cloud
* Transfer - Pay for data transfer out of the cloud (transfer into the cloud is free)

<!-- Security -->

# Responsibility

* Customer - Responsible for security in the cloud
* AWS - Responsible for security of the cloud
