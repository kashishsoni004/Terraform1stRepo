
# local works like variable but its value is fixed and cannot be changed during runtime
locals {
    environment = "dev"
  ami = "ami-07ff62358b87c7116"
  instance_type = "t2.micro"
  tags = "lifecycle-instance"
}


resource "aws_instance" "name" {
    ami           = local.ami
    instance_type = local.instance_type
    tags = {
        Name = local.tags
    }
  
}