#Creating IGW to route the traffic of Public Subnet
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = format("%s-%s", var.environment, "IGW")
  }
}
