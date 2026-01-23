provider "aws" {
    region = "us-east-1"
  
}

resource "aws_instance" "name" {
    ami          = "ami-07ff62358b87c7116"
   instance_type = "t2.micro"
   user_data =file("test.sh")
   tags = {
        Name = "taint-example"
   }

  
}