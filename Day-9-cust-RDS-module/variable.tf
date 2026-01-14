variable "vpc" {
    description = "The CIDR block for the VPC"
    type        = string
    default     = ""
}
variable "vpc_tags" {
    description = "Tags for the VPC"
    type        = string
    default     = ""
}
variable "subnet1_cidr" {
    description = "The CIDR block for the first subnet"
    type        = string
    default     = ""
}
variable "subnet1_tags" {
    description = "Tags for the first subnet"
    type        = string
    default     = ""
}
variable "subnet_az1" {
    type = string
    default = ""
  
}
variable "subnet_az2" {
    type = string
    default = ""
  
}
variable "subnet2_cidr" {
    description = "The CIDR block for the second subnet"
    type        = string
    default     = ""
}
variable "subnet2_tags" {
    description = "Tags for the second subnet"
    type        = string
    default     = ""
}
variable "db_subnet_group_name" {
    description = "The name of the DB subnet group"
    type        = string
    default     = ""
}
variable "db_subnet_group_tags" {
    description = "Tags for the DB subnet group"
    type        = string
    default     = ""
}
variable "iam_role_name" {
    description = "The name of the IAM role"
    type        = string
    default     = ""
}
variable "assume_role_policy" {
    description = "The assume role policy for the IAM role"
    type        = string
    default     = ""
}
variable "attachment_role" {
    description = "The name of the IAM role to attach the policy to"
    type        = string
    default     = ""
  
}
variable "policy_arn" {
    description = "The ARN of the policy to attach to the IAM role"
    type        = string
    default     = ""
}
variable "allocated_storage" {
    type = string
    default = 20
  
}
variable "identifier" {
    type = string
    default = ""
}
variable "engine" {
    type = string
    default = ""
  
}
variable "engine_version" {
    type = string
    default = ""
  
}
variable "db_name" {
    type = string
    default =""
}
variable "instance_class" {
    type = string
    default = ""
}
variable "username" {
    type = string
    default = ""
}
variable "password" {
    type = string
    default = ""  
}
variable "backup_retention_period" {
    type = string
    default = ""
  
}
variable "backup_window" {
    type = string
    default = ""  
}
variable "monitoring_interval" {
    type = string
    default = ""  
}
variable "maintenance_window" {
    type = string
    default = ""
  
}
variable "deletion_protection" {
    type = string
    default = true
  
}
variable "skip_final_snapshot" {
    type = string
    default = true
  
}
variable "rds_tags" {
    type = string
    default = ""
}

variable "identifier_replica" {
    type = string
    default = ""
  
}
variable "instance_class_replica" {
    type = string
    default = ""
  
}
variable "engine_replica" {
    type = string
    default = ""
  
}
variable "replica_tags" {
    type = string
    default = ""
  
}
