resource "aws_vpc" "name" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "vpc"
    }
  
}
resource "aws_subnet" "name" {
    vpc_id = aws_vpc.name.id
    cidr_block = "10.0.0.0/24"
    availability_zone = "us-east-1a"
    tags = {
        Name = "public"
    }
}
resource "aws_subnet" "name2" {
    vpc_id = aws_vpc.name.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "us-east-1b"
    tags = {
        Name = "private"
    }
  
}

resource "aws_db_subnet_group" "name" {
    name       = "rds-subnet-group"
    subnet_ids = [aws_subnet.name.id, aws_subnet.name2.id]
    tags = {
        Name = "rds-subnet-group"
    }
}
resource "aws_db_instance" "rdsdata" {
    allocated_storage    = 20
    db_name              = "database1"
    identifier           = "rds-test"
    engine               = "mysql"
    engine_version       = "8.0"
    instance_class       = "db.t3.micro"
    username             = "admin"
    password             = "password123"
    parameter_group_name = "default.mysql8.0"
    db_subnet_group_name   = aws_db_subnet_group.name.name

#Enablle backup and retention
     backup_retention_period = 7  #Retain backups for 7 days
     backup_window = "02:00-03:00" # Daily backup window from 2 AM to 3 AM UTC

 #Enable monitoring (cloudwatch enhanced monitoring)
     monitoring_interval   = 60  # collect metrics every 60 seconds
    monitoring_role_arn    = aws_iam_role.name.arn

# maintenance window
     maintenance_window    = "sun:04:00-sun:04:30" # Weekly maintenance window on Sundays from 4 AM to 4:30 AM UTC

 #Enable deletion protection
     deletion_protection   = false # Set to true to prevent accidental deletion

 # skip final snapshot
    skip_final_snapshot   = true          

}
resource "aws_db_instance" "readreplica" {
    identifier           = "rds-read-replica"
    instance_class       = "db.t3.micro"
    engine               = "mysql"
   replicate_source_db = aws_db_instance.rdsdata.arn
    db_subnet_group_name = aws_db_subnet_group.name.name
  
}
resource "aws_iam_role" "name" {
    name = "rds-monitoring-role"
    assume_role_policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                Action = "sts:AssumeRole"
                Effect = "Allow"
                Principal = {
                    Service = "monitoring.rds.amazonaws.com"
                }
            }
        ]
    })
  
}
resource "aws_iam_role_policy_attachment" "name" {
    role       = aws_iam_role.name.name
    policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonRDSEnhancedMonitoringRole"
  
}