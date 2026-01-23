provider "aws" {
    region = "us-east-1"  
}
variable "aws_instance" {
    type = list(string)
    default = ["one", "two", "three"]
  
}
resource "aws_instance" "wab" {
    ami = "ami-07ff62358b87c7116"
    instance_type = "t2.micro"
    for_each = toset (var.aws_instance)
    tags = {
        Name = each.key
    }
}