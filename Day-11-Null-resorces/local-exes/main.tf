# provider "aws" {
#     region = "us-east-1"  
  
# }


# resource "aws_key_pair" "key" {
#     key_name = "my-key"
#     public_key = file("~/.ssh/my-key.pub")  
# }
# resource "aws_instance" "name" {
#     ami ="ami-07ff62358b87c7116"
#     instance_type = "t2.medium"
#    # subnet_id = aws_subnet.key.id
#     key_name = aws_key_pair.key.key_name
#    # vpc_security_group_ids = [aws_security_group.name.id]
#    # iam_instance_profile = aws_iam_instance_profile.name.name
#     tags = {
#         Name = "provisioner"
#     }
    
# }
# resource "aws_s3_bucket" "name" {
#     depends_on = [ aws_instance.name ]
#     bucket = "provisioner-bucket-1234567890"
# }

# resource "null_resource" "name" {
#     depends_on = [ aws_s3_bucket.name]

#     # connection {
#     #     type = "ssh"
#     #   user = "ec2-user"
#     #  private_key = file("~/.ssh/my-key")
#     #  host = aws_instance.name.public_ip
#     # }
#     provisioner "local-exec" {

#         command = "echo 'S3 Bucket Created: ${aws_s3_bucket.name.bucket}' >> bucket_info.txt"
      
#     }
# }

