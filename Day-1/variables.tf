variable "ami_id" {
    description = "The AMI ID for the EC2 instance"
    type        = string
    default     = "ami-0532be01f26a3de55"
  
}
variable "type" {
    description = "The type of instance to use"
    type        = string
    default     = "t2.medium"
  
}
