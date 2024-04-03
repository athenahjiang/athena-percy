<!-- Virtual Private Cloud (VPC) -->

Provisions logically isolated section of the AWS Cloud to launch AWS resources in a virtual private network.

<!-- Terms -->

* Ingress - Entrance

* Egress - Exit

* Subnet - A range of IP addresses in VPC, can be public or private.

* IP addressing - Assign IPv4 and IPv6 addresses to VPCs and subnets.

* Routing - Determining where network traffic is directed for subnet or gateway.

* Endpoint - Connect vpc to other services.

* VPC flow logs - Captures IP traffic of network interfaces in VPC.

* VPN connections - Connects VPCs to on-premises networks.

# Gateway

Endpoints that connect vpc to another network.

* Virtual Private Gateway (VPG) - On AWS side, connects local networks to the vpc.

* Customer Gateway (CGW) - On customer side, connects to VPG.

* Transit Gateway - Central hub for traffic routing.

<!-- Operation -->

# Default VPC

One in each region.

# Peering

Connecting one vpc to another by routing traffic between resources in two VPCs.
VPC peering is not transitive. (a->b && b->c != a->c)

<!-- Performance -->

<!-- Pricing -->

<!-- Security -->
