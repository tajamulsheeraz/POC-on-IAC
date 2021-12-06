#Creating Public Subnets
resource "aws_subnet" "public" {
  count             = length(var.subnet_cidrs_public)
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.subnet_cidrs_public[count.index]
  availability_zone = var.availability_zones[count.index]
  tags = {
    Name = format("%s-%s", var.environment, "Pub-Subnet-${count.index + 1}")
  }

}
#Crating Private Subnets
resource "aws_subnet" "private" {
  count             = length(var.subnet_cidrs_private)
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.subnet_cidrs_private[count.index]
  availability_zone = var.availability_zones[count.index]
  tags = {
    Name = format("%s-%s", var.environment, "Pri-Subnet-${count.index + 1}")
  }
}
