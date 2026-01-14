module "dev" {
    source = "../Day-9-cust-RDS-module"
    vpc         = "10.0.0.0/16"
  vpc_tags      = "Module-RDS-VPC"
  subnet1_cidr  = "10.0.0.0/24"
  subnet2_cidr  = "10.0.1.0/24"
  subnet_az1    = "us-east-1a"
  subnet_az2    = "us-east-1b"
  subnet1_tags  = "RDS-Subnet-1"
  subnet2_tags  = "RDS-Subnet-2"
  iam_role_name = "rds-monitoring-role"
  attachment_role = "rds-monitoring-role-attachment"
    db_subnet_group_tags = "RDS-Subnet-Group"
    db_subnet_group_name= "rds-subnet-group"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "monitoring.rds.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
  ] 
})

  policy_arn              = "arn:aws:iam::aws:policy/service-role/AmazonRDSEnhancedMonitoringRole"
  identifier              = "module-rds-instance"
  allocated_storage       = 20
  engine                  = "mysql"
  engine_version          = "8.0"
  instance_class          = "db.t3.micro"
  db_name                 = "admin"
  username                = "ram"
  password                = "Admin12345"
  skip_final_snapshot     = true
  backup_retention_period = 7
  backup_window           = "07:00-09:00"
  monitoring_interval     = 60
  maintenance_window      = "sun:23:00-mon:01:00"
  deletion_protection     = true
  rds_tags                = "rds-module" 

  identifier_replica = "module-rds-replica"
    instance_class_replica   = "db.t3.micro"
    engine_replica = "mysql"
    replica_tags = "Module-RDS-Replica-Instance-Replica"
    
  
}