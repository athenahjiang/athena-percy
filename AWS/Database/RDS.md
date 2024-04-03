<!-- Relational Database Service (RDS) -->

SQL database in cloud.

<!-- Terms -->

* Instance - Isolated db env, can contain one or more dbs.

* Class - Computation and memory capacity of an instance.

* Engine - Specific relational db software that runs on an instance (mysql or psql).

<!-- Operation -->

<!-- Performance -->

# Read Replicas

* Scale the read workload of DB
* Can create up to 15 read replicas
* Data is only written to the main DB

# Multi-AZ

* Failover in case of AZ outage (high availability)
* Data is only read/written to the main database
* Can only have one other AZ as failover

# Multi-Region

* Disaster recovery in case of region issue
* Can create read replicas in other regions
* Data is only written to the main DB

# Storage

* General Purpose (SSD)
* Provisioned IOPS (PIOPS)
* Magnetic

<!-- Pricing -->

<!-- Security -->

<!-- Test -->

# Engines

Postgres; MySQL; MariaDB; Oracle;
Microsoft SQL Server;
Aurora (AWS Proprietary database)

# Advantages of RDS over deploying DB on EC2

* Automated provisioning, OS patching
* Continuous backups and restore to specific timestamp (Point in Time Restore)!
* Monitoring dashboards
* Read replicas for improved read performance
* Multi AZ setup for DR (Disaster Recovery)
* Maintenance windows for upgrades
* Scaling capability (vertical and horizontal)
* Storage backed by EBS (gp2 or io1)
