# POC-on-IAC
Automatically Deploying Containers on EC2 Instance in AWS Environment


Step 1:
#Provision ubuntu ec2 machine and install the below tools.
install terraform
install ansible
intsall unzip


Step 2:
#The  below terraform templates provision complete VPC setup 
#Running ansible playbook by using terraform and ansible playbook contains installation and running docker compose file
#Provide secret and access key in the provider.tf file
#Run the follwoing commands 
terraform init
terraform validate
terraform plan
terraform apply --auto-approve
