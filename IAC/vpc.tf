#Creating VPC with 2 Public and 2 Private subnets.
resource "aws_vpc" "vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"
  tags = {
    Name = format("%s-%s", var.environment, "VPC")
  }
}
