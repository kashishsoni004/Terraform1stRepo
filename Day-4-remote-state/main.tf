resource "aws_instance" "name" {
    ami           = "ami-068c0051b15cdb816"
    instance_type ="t2.micro"
    
    tags = {
        Name = "Firstec2"
    }
    
}
resource "aws_instance" "test" {
    ami           = "ami-068c0051b15cdb816"
    instance_type ="t2.micro"
    tags = {
        Name = "Secondec2"
}
}