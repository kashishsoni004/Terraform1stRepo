variable "vpc_cidr" {
    type        = string
    default     = " "
  
}
variable "vpc_tag" {
    type        = string
    default     = " "
  
}
variable "subnet1" {
    type = string
    default = ""
  
}


variable "subnet_cidr" {
    type = string
    default = ""
  
}
variable "subnet_az" {
    type = string
    default = ""
  
}
variable "sub1_tag" {
    type = string
    default = ""
  
}
variable "subnet2" {
    type = string
    default = ""
  
}
variable "sub2_tag" {
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
variable "ami_id" {
    description = "AMI ID for the EC2 instance"
    type = string
    default = ""
}
variable "instance_type" {
    description = "EC2 Instance Type"
    type = string
    default = ""

}
variable "instance_tag" {
    description = "Tag for the EC2 instance"
    type = string
    default = ""
}