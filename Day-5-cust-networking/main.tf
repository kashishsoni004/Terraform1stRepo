resource "aws_vpc" "name" {
     
    cidr_block =  "10.0.0.0/16"
    tags = {
        Name = "cust-vpc"
    }
}
resource "aws_subnet" "name" {
    vpc_id = aws_vpc.name.id
    cidr_block = "10.0.0.0/24"
    tags = {
        Name = "public-subnet"
    }
}
resource "aws_subnet" "name2" {
    vpc_id = aws_vpc.name.id
    cidr_block = "10.0.1.0/24"
    tags = {
        Name = "privat-subnet"
    }
}
resource "aws_internet_gateway" "name" {
    vpc_id = aws_vpc.name.id
    tags = {
        Name = "cust-igw"
    }
}
resource "aws_route_table" "name" {
    vpc_id = aws_vpc.name.id
    tags = {
        Name = "cust-route-table"
    }
}
resource "aws_route" "name" {
    route_table_id = aws_route_table.name.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.name.id
}
resource "aws_route_table_association" "name" {
    subnet_id = aws_subnet.name.id
    route_table_id = aws_route_table.name.id
}

resource "aws_eip" "name" {
    domain = "vpc"
    tags = {
        Name = "cust-eip"
    }  
}
resource "aws_nat_gateway" "name" {
    allocation_id = aws_eip.name.id
    subnet_id = aws_subnet.name.id
    tags = {
        Name = "cust-nat-gw"
    }
  
}
resource "aws_route_table" "name2" {
    vpc_id = aws_vpc.name.id
    tags = {
        Name = "private-route-table"
    }
}

resource "aws_route" "name2" {
    route_table_id = aws_route_table.name2.id
    destination_cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.name.id
}

resource "aws_route_table_association" "name2" {
    route_table_id = aws_route_table.name2.id
    subnet_id = aws_subnet.name2.id
}
resource "aws_security_group" "name" {
    name        = "allow_http_ssh"
    description = "Allow HTTP and SSH inbound traffic"
    vpc_id      = aws_vpc.name.id

    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name = "cust-security-group"
    }  
}
resource "aws_instance" "web_server" {
    ami           = "ami-068c0051b15cdb816"
    instance_type ="t2.micro"
    subnet_id = aws_subnet.name.id
    vpc_security_group_ids = [aws_security_group.name.id]
       tags = {
        Name = "web-server"
    }
    
}
resource "aws_instance" "app_server" {
    ami           = "ami-068c0051b15cdb816"
    instance_type ="t2.micro"
    subnet_id = aws_subnet.name2.id
    vpc_security_group_ids = [aws_security_group.name.id]
       tags = {
        Name = "app-server"
    }    
}

