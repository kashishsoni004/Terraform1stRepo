resource "aws_vpc" "name" {
    cidr_block = var.vpc_cidr
    tags = {
        Name = var.vpc_tag
    }
}

resource "aws_subnet" "name" {
    vpc_id = aws_vpc.name.id
    cidr_block = var.subnet_cidr    
    availability_zone = var.subnet_az
    tags = {
        Name = var.sub1_tag
    }

  
}
resource "aws_subnet" "name2" {
    vpc_id = aws_vpc.name.id
    cidr_block = var.subnet_cidr2    
    availability_zone = var.subnet_az2
    tags = {
        Name = var.sub2_tag
    }
  
}
resource "aws_instance" "name"{
    ami = var.ami_id
    instance_type = var.instance_type
    subnet_id = aws_subnet.name.id
    availability_zone = var.subnet_az
    tags = {
        Name = "Module-EC2-Instance"
    }
}