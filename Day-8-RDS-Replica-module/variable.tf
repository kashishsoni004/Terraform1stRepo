variable "vpc_cidr" {
    type = string
    default = ""
  
}
variable "vpc_tags" {
    type = string
    default = ""
  
}
variable "subnet_cidr1" {
    type = string
    default = ""
  
}
variable "subnet_az1" {
    type = string
    default = ""
  
}
variable "subnet1_tags" {
    type = string
    default = ""
  
}
variable "subnet_cidr2" {
    type = string
    default = ""
  
}
variable "subnet_az2" {
    type = string
    default = ""
  
}
variable "subnet2_tags" {
    type = string
    default = ""
  
}
variable "db_subnet_group_tags" {
    type = string
    default = ""
  
}
variable "db_subnet_group_name" {
    type = string
    default = ""
  
}
variable "iam_role_name" {
    type = string
    default = ""
  
}
variable "assume_role_policy" {
    type = string
    default = ""
  
}
variable "role_attachment_name" {
    type = string
    default = ""
  
}
variable "policy_arn" {
    type = string
    default = ""
  
}
variable "identifier_db_instance" {
    type = string
    default = ""
  
}
variable "allocated_storage" {
    type = number
    default = 0
  
}
variable "engine" {
    type = string
    default = ""
  
}
variable "engine_version" {
    type = string
    default = ""
  
}
variable "instance_class" {
    type = string
    default = ""        
}
variable "db_name" {
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
variable "parameter_group_name" {
    type = string
    default = ""
  
}
variable "backup_retention_period" {
    type = number
    default = 0
}
variable "backup_window" {
    type = string
    default = ""
  
}
variable "db_instance_tags" {
    type = string
    default = ""
  
}
variable "monitoring_interval" {
    type = number
    default = 0
}
variable "maintenance_window" {
    type = string
    default = ""
  
}
variable "deletion_protection" {
    type = bool
    default = false
  
}
variable "identifier_db_instance_replica" {
    type = string
    default = ""
  
}
variable "source_db_instance_identifier" {
    type = string
    default = ""
  
}
variable "replica_instance_class" {
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

