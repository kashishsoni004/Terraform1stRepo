provider "aws" {
    region = "us-east-1"
  
}

resource "aws_instance" "name" {
    ami          = "ami-07ff62358b87c7116"
   instance_type = "t2.micro"
   tags = {
        Name = "taint-example"
   }
  
}

# terraform taint <resource_type.resource_name>
# This command marks a Terraform-managed resource as tainted, forcing it to be destroyed and recreated on the next apply.