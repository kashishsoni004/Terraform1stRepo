provider "aws" {
    region = "us-east-1"  
}

resource "aws_vpc" "name" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "provisioner-vpc"
    }
  
}
resource "aws_internet_gateway" "name" {
     vpc_id = aws_vpc.name.id
}

# resource "aws_internet_gateway_attachment" "name" {
#     vpc_id = aws_vpc.name.id
#     internet_gateway_id = aws_internet_gateway.name.id
  

resource "aws_subnet" "name" {
    vpc_id = aws_vpc.name.id
    cidr_block = "10.0.0.0/24"
    availability_zone = "us-east-1a"
    tags = {
        Name = "provisioner-subnet"
    }
}
resource "aws_route_table" "name" {
    vpc_id = aws_vpc.name.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.name.id
  
}
}
resource "aws_route_table_association" "name" {
    subnet_id = aws_subnet.name.id
    route_table_id = aws_route_table.name.id
}
resource "aws_security_group" "name" {
    vpc_id = aws_vpc.name.id
    name = "provisioner-sg"
    description = "Allow SSH and HTTP"
    ingress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]

}
}
resource "aws_key_pair" "name" {
    key_name = "provisioner-key"
    public_key = file("~/.ssh/provisioner-key.pub")
  
}
resource "aws_instance" "name" {
    ami           = "ami-07ff62358b87c7116"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.name.id
    key_name = aws_key_pair.name.key_name
    vpc_security_group_ids = [aws_security_group.name.id]
    tags = {
        Name = "provisioner-instance"
    }
    connection {
      type = "ssh"
      user = "ec2-user"
     private_key = file("~/.ssh/provisioner-key")
     host = self.public_ip
    }
    provisioner "local-exec" {
        command = "touch file_created_by_provisioner.txt"
        
    }
}