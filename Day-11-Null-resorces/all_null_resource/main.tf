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
    name = "provisioner-role"

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
    key_name = "my-key"
    public_key = file("~/.ssh/my-key.pub")  
}
resource "aws_instance" "name" {
    ami ="ami-07ff62358b87c7116"
    instance_type = "t2.medium"
    subnet_id = aws_subnet.name.id
    key_name = aws_key_pair.key.key_name
    vpc_security_group_ids = [aws_security_group.name.id]

    iam_instance_profile = aws_iam_instance_profile.name.name
    tags = {
        Name = "provisioner"
    }
    
}
resource "aws_s3_bucket" "name" {
    bucket = "provisioner-bucket-1234567890"
}

resource "null_resource" "name" {
    depends_on = [ aws_s3_bucket.name]

    
    # provisioner "local-exec" {

    #     command = "echo 'S3 Bucket Created: ${aws_s3_bucket.name.bucket}' >> bucket_info.txt"
      
    # }

    #  connection {
    #     type = "ssh"
    #     user = "ec2-user"
    #     private_key = file("~/.ssh/my-key")
    #     host = aws_instance.name.public_ip
    # }

    connection {
        type = "ssh"
        user = "ec2-user"
        private_key = file("~/.ssh/my-key")
        host = aws_instance.name.public_ip
    }
        
        
      provisioner "file" {
        source = "script.sh"
        destination = "/home/ec2-user/script.sh"        
      }

      provisioner "remote-exec" {
        inline = [
            "aws s3 cp /home/ec2-user/script.sh s3://${aws_s3_bucket.name.bucket}/script.sh"
        ]
        }
}









# resource "aws_key_pair" "name" {
#     key_name = "provisioner-key"
#     public_key = file("~/.ssh/provisioner-key.pub")
  
# }
# resource "aws_instance" "name" {
#     ami           = "ami-07ff62358b87c7116"
#     instance_type = "t2.micro"
#     subnet_id = aws_subnet.name.id
#     key_name = aws_key_pair.name.key_name
#     vpc_security_group_ids = [aws_security_group.name.id]
#     tags = {
#         Name = "provisioner-instance"
#     }
#     connection {
#       type = "ssh"
#       user = "ec2-user"
#      private_key = file("~/.ssh/provisioner-key")
#      host = self.public_ip
#     }
#     provisioner "local-exec" {
#         command = "touch file_created_by_provisioner.txt"
        
#     }
# }