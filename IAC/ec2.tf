resource "aws_instance" "bastion" {
  instance_type               = "t2.medium"
  ami                         = var.bastion
  key_name                    = var.key_pair
  vpc_security_group_ids      = [aws_security_group.allow_tls.id]
  subnet_id                   = aws_subnet.public.0.id
  associate_public_ip_address = true
  count                       = 1
  tags = {
    Name = format("%s-%s", var.environment, "server")

  }
  provisioner "local-exec" {
    command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook  -u ubuntu --private-key g.pem  ansible/docker_deployment.yaml"
  }
}


