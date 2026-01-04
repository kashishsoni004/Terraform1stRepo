resource "aws_instance" "name" {
    ami           = "ami-068c0051b15cdb816"
    instance_type ="t2.micro"
    
    tags = {
        Name = "First2"
    }
    
}
resource "aws_instance" "test" {
    ami           = "ami-068c0051b15cdb816"
    instance_type ="t2.medium"
    tags = {
        Name = "second2"
}
}
# resource "aws_s3_bucket" "name" {
#     bucket = "kshghdbdhdhjchxgxxhcjjc"
  
# }
# resource "aws_instance" "mahi" {
#     ami           = "ami-068c0051b15cdb816"
#     instance_type ="t2.large"
#     tags = {
#         Name = "thirdece2"
#     } 
# }
# resource "aws_instance" "bhawna" {
#     ami           = "ami-068c0051b15cdb816"
#     instance_type ="t2.micro"
    
#     tags = {
#         Name = "Fourthec2"
#     }

  
# }