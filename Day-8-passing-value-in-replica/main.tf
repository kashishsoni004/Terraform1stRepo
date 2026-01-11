module "dev" {
    source = "../Day-8-RDS-Replica-module"
    vpc_cidr      = "10.0.0.0/16"
    vpc_tags      = "Module-RDS-Replica-VPC"
    subnet_cidr1  = "10.0.0.0/24"
    subnet_cidr2  = "10.0.1.0/24"
    subnet_az1    = "us-east-1a"
    subnet_az2    = "us-east-1b"
    subnet1_tags  = "Module-RDS-Replica-Subnet-1"
    subnet2_tags  = "Module-RDS-Replica-Subnet-2"
    db_subnet_group_name = "rds-replica-subnet-group"
    db_subnet_group_tags = "Module-RDS-Replica-Subnet-Group"
    iam_role_name = "module-rds-replica-monitoring-role"
    assume_role_policy = jsonencode({
         "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "",
            "Effect": "Allow",
            "Principal": {
                "Service": [
                    "monitoring.rds.amazonaws.com"
                ]
            },
            "Action": [
                "sts:AssumeRole"
            ]
        }
    ]
    })
    policy_arn    = "arn:aws:iam::aws:policy/service-role/AmazonRDSEnhancedMonitoringRole"
    identifier_db_instance              = "module-rds-replica-instance"
    allocated_storage       = 20
    engine                  = "mysql"
    engine_version          = "8.0"     
    instance_class          = "db.t3.micro"
    db_name                 = "admin"
    username                = "adminuser"
    password                = "Admin12345"
    parameter_group_name    = "default.mysql8.0"
    monitoring_interval = "60"
    maintenance_window      = "sun:23:00-mon:01:00"
    deletion_protection     = true
    backup_retention_period = 7
    backup_window           = "07:00-09:00"
    db_instance_tags        = "Module-RDS-Replica-Instance"
    
    identifier_db_instance_replica = "module-rds-replica-instance-replica"
    replica_instance_class = "db.t3.micro"
    engine_replica = "mysql"
    replica_tags = "Module-RDS-Replica-Instance-Replica"
    source_db_instance_identifier = "module-rds-replica-instance"

  
}