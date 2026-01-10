module "test" {
  source  = "../Day-8-RDS-module"
  vpc_cidr      = "10.0.0.0/16"
  vpc_tags      = "Module-RDS-VPC"
  subnet_cidr1  = "10.0.0.0/24"
  subnet_cidr2  = "10.0.1.0/24"
  subnet_az1    = "us-east-1a"
  subnet_az2    = "us-east-1b"
  subnet1_tags  = "Module-RDS-Subnet-1"
  subnet2_tags  = "Module-RDS-Subnet-2"
  iam_role_name = "module-rds-monitoring-role"
  role_attachment_name = "module-rds-monitoring-role-attachment"
    db_subnet_group_tags = "Module-RDS-Subnet-Group"
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
  username                = "adminuser"
  password                = "Admin12345"
  parameter_group_name    = "default.mysql8.0"
  backup_retention_period = 7
  backup_window           = "07:00-09:00"
  db_instance_tags        = "Module-RDS-Instance"
  db_subnet_group_name12 = "rds-subnet-group"
  monitoring_interval     = 60
  maintenance_window      = "sun:23:00-mon:01:00"
  monitoring_role_arn =  "arn:aws:iam::123456789012:role/module-rds-monitoring-role"
    deletion_protection     = true
    #skip_final_snapshot    = false
}
