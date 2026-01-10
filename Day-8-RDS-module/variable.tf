variable "vpc_cidr" {
    description = "VPC ID where resources will be created"
    type        = string
  
}
variable "vpc_tags" {
    description = "Tags for the VPC"
    type        = string
  
}
variable "subnet_cidr1" {
    description = "CIDR block for the subnet"
    type        = string
  
}
variable "subnet_cidr2" {
    description = "CIDR block for the second subnet"
    type        = string
  
}
variable "subnet_az1" {
    description = "Availability zone for the subnet"
    type        = string
  
}
variable "subnet_az2" {
    description = "Availability zone for the second subnet"
    type        = string
  
}
variable "subnet1_tags" {
    description = "Tags for the first subnet"
    type        = string
  
}
variable "subnet2_tags" {
    description = "Tags for the second subnet"
    type        = string
  
}
variable "db_subnet_group_name" {
    description = "Name for the DB subnet group"
    type        = string
  
}
variable "db_subnet_group_tags" {
    description = "Tags for the DB subnet group"
    type        = string
  
}
# variable "subnet_ids" {
#     description = "Subnet IDs for the DB subnet group"
#     type        = list(string)
  

variable "iam_role_name" {
    description = "Name for the IAM role"
    type        = string
  
}
variable "assume_role_policy" {
    description = "Assume role policy for the IAM role"
    type        = string
    default = ""
  
} 
variable "role_attachment_name" {
    description = "Name for the IAM role policy attachment"
    type        = string
}

variable "policy_arn" {
    description = "Policy ARN for the IAM role policy attachment"
    type        = string
}

variable "identifier" {
    description = "Identifier for the RDS instance"
    type        = string
}

variable "allocated_storage" {
    description = "Allocated storage for the RDS instance"
    type        = number
}

variable "engine" {
    description = "Database engine for the RDS instance"
    type        = string
}

variable "engine_version" {
    description = "Database engine version for the RDS instance"
    type        = string
}

variable "instance_class" {
    description = "Instance class for the RDS instance"
    type        = string
}

variable "db_name" {
    description = "Database name for the RDS instance"
    type        = string
}

variable "username" {
    description = "Master username for the RDS instance"
    type        = string
}

variable "password" {
    description = "Master password for the RDS instance"
    type        = string
    sensitive   = true
}

variable "parameter_group_name" {
    description = "Parameter group name for the RDS instance"
    type        = string
}

variable "db_subnet_group_name12" {
    description = "DB subnet group name for the RDS instance"
    type        = string
  
}

variable "backup_retention_period" {
    description = "Backup retention period for the RDS instance"
    type        = number
}

variable "backup_window" {
    description = "Backup window for the RDS instance"
    type        = string
}


variable "monitoring_interval" {
    description = "Monitoring interval for the RDS instance"
    type        = number
}

variable "monitoring_role_arn" {
    description = "Monitoring role ARN for the RDS instance"
    type        = string
}

variable "maintenance_window" {
    description = "Maintenance window for the RDS instance"
    type        = string
}
variable "db_instance_tags" {
    description = "Tags for the DB instance"
    type        = string
}
variable "deletion_protection" {
    description = "Deletion protection for the RDS instance"
    type        = bool
    default     = false
}
