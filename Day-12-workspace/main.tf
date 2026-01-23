provider "aws" {
    region = "us-east-1"
  
}
resource "aws_instance" "name" {
    ami = "ami-07ff62358b87c7116"
    instance_type = "t2.micro"
    tags = {
        Name = "example"
    }
}

# terraform workspace show
# terraform workspace new <workspace_name>
# terraform workspace select <workspace_name>
# terraform workspace list
# terraform workspace delete <workspace_name>
# Workspaces allow you to manage multiple environments (like dev, staging, prod) using the same configuration.