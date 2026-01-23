provider "aws" {
    region = "us-east-1"
  
}
#  create multiple instances using count

# resource "aws_instance" "name" {
#     ami = "ami-07ff62358b87c7116"
#     instance_type = "t2.micro"
#     count = 3
#     tags = {
#         name = "server-${count.index}"
#     }
  
# }


# Define a variable to hold the list of server names

# variable "server" {
#     type    = list(string)
#     default = ["one", "two", "three"]
# }
# resource "aws_instance" "web" {
#     ami           = "ami-07ff62358b87c7116"
#     instance_type = "t2.micro"
#     count         = length (var.server)
  
#     tags = {
#         Name = var.server[count.index]
#     }
# } 


# Create instances based on the boolean variable
variable "server" {
    type = bool
    default = true
  
}
resource "aws_instance" "name" {
    ami          = "ami-07ff62358b87c7116"
   instance_type = "t2.micro"
   count = var.server ? 2 :0
   tags = {
        Name = "server-${count.index}"
   }

}