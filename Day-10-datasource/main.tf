data "aws_subnet" "name" {
    filter {
        name   = "tag:Name"
        values = ["test"]
    }
}
data "aws_ami" "amzlinux" {
    most_recent = true
    owners      = ["amazon"]
    filter {
        name   = "name"
        values = ["amzn2-ami-hvm-*-x86_64-gp2"]
    }

}
resource "aws_instance" "name" {
   ami = data.aws_ami.amzlinux.id
    instance_type = "t2.micro"
    subnet_id = data.aws_subnet.name.id
}