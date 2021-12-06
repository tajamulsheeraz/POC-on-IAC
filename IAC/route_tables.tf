#Creating VPC Private route table
resource "aws_route_table" "private-rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-gw.id
  }
  tags = {
    Name = format("%s-%s", var.environment, "private-rt")
  }
}

#Creating public Route Table
resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
  tags = {
    Name = format("%s-%s", var.environment, "public-rt")
  }
}

#Public Route table subent association
resource "aws_route_table_association" "public" {
  count          = length(var.subnet_cidrs_public)
  subnet_id      = element(aws_subnet.public.*.id, count.index)
  route_table_id = aws_route_table.public-rt.id
}
#Private Route table subent association
resource "aws_route_table_association" "private" {
  count          = length(var.subnet_cidrs_private)
  subnet_id      = element(aws_subnet.private.*.id, count.index)
  route_table_id = aws_route_table.private-rt.id
}
