provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "name" {
  name        = "allow-ssh-http"
  description = "Allow SSH and HTTP"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
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
}

resource "aws_key_pair" "test" {
  key_name   = "test"
  public_key = file("~/.ssh/file-key.pub")
}
resource "aws_instance" "name" {
  ami           = "ami-07ff62358b87c7116"
  instance_type = "t2.micro"
  #subnet_id = aws_subnet.name.id
  key_name = aws_key_pair.test.key_name
 vpc_security_group_ids = [aws_security_group.name.id]
  tags = {
    Name = "ec2"
    
  }
  connection {
    type       = "ssh"
    user       = "ec2-user"
    private_key = file("~/.ssh/file-key")
    host       = self.public_ip
  }
  provisioner "file" {
    source      = "dev.html"
    destination = "/home/ec2-user/dev.html"

  }
}
