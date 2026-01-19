resource "aws_vpc" "name" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "target-vpc"
    }
  
}
resource "aws_subnet" "name" {
    vpc_id = aws_vpc.name.id
    cidr_block = "10.0.0.0/24"
    tags = {
        Name = "target-subnet"
    }
}

resource "aws_instance" "name" {
    ami = "ami-07ff62358b87c7116"
    instance_type = "t2.micro"
    tags = {
        Name = "target-instance"
    }
}

resource "aws_instance" "dev" {
    ami = "ami-07ff62358b87c7116"
    instance_type = "t2.micro"
    tags = {
        Name = "dev-instance"
    }
  
}

resource "aws_s3_bucket" "name" {
    bucket = "target-resource-bucket-1234567890"
  
}
# if your creating specific resource and want to target that resource during plan and apply use the below commands
# tf plan -target=(resource_type.resource_name)
# Example: tf plan -target=aws_instance.dev
# tf apply -target=(resource_type.resource_name)
# Example: tf apply -target=aws_instance.dev

#
