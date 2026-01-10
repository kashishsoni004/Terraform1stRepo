module "dev" {
    source = "../Day-8-module"
    vpc_cidr = "10.0.0.0/16"
    vpc_tag = "Module-VPC"
    subnet_cidr = "10.0.0.0/24"
    subnet_cidr2 = "10.0.1.0/24"
    subnet_az = "us-east-1a"
    subnet_az2 = "us-east-1b"
    sub1_tag = "Module-Subnet-1"
    sub2_tag = "Module-Subnet-2"
    ami_id = "ami-0c02fb55956c7d316" # Example AMI ID, replace with a valid one
    instance_type = "t2.micro"
    instance_tag = "Module-EC2-Instance"    



}