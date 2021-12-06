resource "null_resource" "ansible" {
depends_on = [aws_nat_gateway.nat-gw]
  provisioner "local-exec" {
    command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u ubuntu --private-key g.pem docker_deployment.yaml"
  }

}
resource "local_file" "hosts_cfg" {
depends_on = [aws_instance.bastion[0]]
  content = templatefile("ansible/hosts.tpl",
    {
      test_clients = aws_instance.bastion[*].public_ip
    }
  )
  filename = "/etc/ansible/hosts"
}

