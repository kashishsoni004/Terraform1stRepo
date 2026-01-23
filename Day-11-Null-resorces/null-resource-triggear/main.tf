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
resource "aws_subnet" "name" {
    vpc_id = aws_vpc.name.id
    cidr_block = "10.0.0.0/24"
     map_public_ip_on_launch = true 
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
resource "aws_s3_bucket" "name" {
    bucket = "mmmjjsjshshsjsjamaamamjsjssh"
  
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
resource "aws_iam_role" "ec2-role" {
    name = "iam-role"

    assume_role_policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "sts:AssumeRole"
            ],
            "Principal": {
                "Service": [
                    "ec2.amazonaws.com"
                ]
            }
        }
    ]
   })
  
}
resource "aws_iam_role_policy_attachment" "s3-attach" {
    role = aws_iam_role.ec2-role.name
    policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
  
}

resource "aws_iam_instance_profile" "name" {
    role = aws_iam_role.ec2-role.name
  
}

resource "aws_key_pair" "key" {
    key_name = "tff-key"
    public_key = file("~/.ssh/tff-key.pub")
}

resource "aws_instance" "ec2" {
    ami           = "ami-0c02fb55956c7d316" # Amazon Linux 2 AMI (HVM), SSD Volume Type
    instance_type = "t2.micro"
    key_name = aws_key_pair.key.key_name
    subnet_id = aws_subnet.name.id
    vpc_security_group_ids = [aws_security_group.name.id]
    iam_instance_profile = aws_iam_instance_profile.name.name

    tags = {
        Name = "dragon-instance"  
    }


provisioner "local-exec" {
    command = "echo 'file created by local-exec provisioner' > instance.info"
}

connection {     
        type = "ssh"  
        user   = "ec2-user"     
        private_key = file("~/.ssh/tff-key")  
        host = aws_instance.ec2.public_ip
}
provisioner "remote-exec" {
    
    inline = [
       "touch test",
         
    ]   
}
# provisioner "file" {
#     # connection {
#     #     type   = "ssh"  
#     #     user   = "ec2-user"     
#     #     private_key = file("~/.ssh/k-key")  
#     #     host = self.public_ip
#     # }
#         source = "test.html"
#         destination ="aws s3 cp /home/ec2-user/test.html s3://${aws_s3_bucket.name.bucket}/test.html"
#     }

  
}



resource "null_resource" "provisioner" {
    depends_on = [ aws_s3_bucket.name]

   triggers = {
     file_hash = filemd5("index.html")
  }
    provisioner "local-exec" {
        command = "echo 'null_resource triggered after EC2 and S3 creation'"
      
    }
    connection {     
            type = "ssh"  
            user = "ec2-user"
            private_key = file("~/.ssh/tff-key")  
            host = aws_instance.ec2.public_ip 
        } 

    provisioner "file" {
        # connection {
        #     type = "ssh"
        #     user = "ec2-user"
        #     private_key = file("~/.ssh/dev-key")
        #     host = aws_instance.ec2.public_ip 
        # }
        source = "index.html"
        destination = "/home/ec2-user/index.html"    
    }

    provisioner "remote-exec" {
        inline = [
            "aws s3 cp /home/ec2-user/index.html s3://${aws_s3_bucket.name.bucket}/index.html"

        ]
    }
    
}