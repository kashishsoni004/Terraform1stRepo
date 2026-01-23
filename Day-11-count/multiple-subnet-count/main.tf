provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "name" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "provisioner-vpc"
  }
}

# create multiple subnets using count
variable "azs" {
  type    = list(string)
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

resource "aws_subnet" "name" {
  count             = length(var.azs)
  vpc_id            = aws_vpc.name.id
  cidr_block        = "10.0.${count.index}.0/24"
  availability_zone = var.azs[count.index]

  tags = {
    Name = "server-${count.index}"
  }
}
