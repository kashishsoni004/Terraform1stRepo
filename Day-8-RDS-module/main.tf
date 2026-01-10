resource "aws_vpc" "name" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = var.vpc_tags
  }
}
resource "aws_subnet" "name" {
  vpc_id            = aws_vpc.name.id
  cidr_block        = var.subnet_cidr1
  availability_zone = var.subnet_az1
  tags = {
    Name = var.subnet1_tags
  }
}
resource "aws_subnet" "name2" {
  vpc_id            = aws_vpc.name.id
  cidr_block        = var.subnet_cidr2
  availability_zone = var.subnet_az2
  tags = {
    Name = var.subnet2_tags
  }
}
resource "aws_db_subnet_group" "name" {
  name       = var.db_subnet_group_name
  subnet_ids = [aws_subnet.name.id, aws_subnet.name2.id]

    tags = {
        Name = var.db_subnet_group_tags
    }
}
resource "aws_iam_role" "name" {
  name               = var.iam_role_name
  assume_role_policy = var.assume_role_policy
}
resource "aws_iam_role_policy_attachment" "name" {
  role       = aws_iam_role.name.name
  policy_arn = var.policy_arn
}
resource "aws_db_instance" "dev" {
  identifier              = var.identifier
  allocated_storage       = var.allocated_storage
  engine                  = var.engine
  engine_version          = var.engine_version
  instance_class          = var.instance_class
  db_name                 = var.db_name
  username                = var.username
  password                = var.password
  #parameter_group_name    = var.parameter_group_name
  db_subnet_group_name    = aws_db_subnet_group.name.name
  skip_final_snapshot     = true
  backup_retention_period = var.backup_retention_period
  backup_window           = var.backup_window
  tags = {
    Name = var.db_instance_tags
  }
  monitoring_interval = var.monitoring_interval
  monitoring_role_arn = aws_iam_role.name.arn

  maintenance_window = var.maintenance_window
  deletion_protection = var.deletion_protection

}
