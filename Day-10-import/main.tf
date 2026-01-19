resource "aws_instance" "my_instance" {
    ami = ""
    instance_type = ""
    tags = {
        Name = ""
    }
}

#  tf import aws_instance.my_instance i-0abcd1234efgh5678
# after this command run 'terraform plan' to see the imported resource in the state file.