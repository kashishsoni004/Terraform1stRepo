resource "aws_instance" "name" {
    ami           = "ami-068c0051b15cdb816"
    instance_type ="t2.micro"
    subnet_id = "subnet-0a14c76e2881b63ae"
       tags = {
        Name = "dev"
    }
    
  
}