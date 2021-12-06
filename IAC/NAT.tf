#Creating the Elastic IP to attach NAT GW Interface.
resource "aws_eip" "nat" {
  vpc = true
  tags = {
    Name = format("%s-%s", var.environment, "NAT-EIP")
  }
}

#Creating NAT GW to route the private subnet traffic.
resource "aws_nat_gateway" "nat-gw" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public.0.id
  tags = {
    Name = format("%s-%s", var.environment, "NAT-GW")
  }
  depends_on = [aws_internet_gateway.gw]
}

