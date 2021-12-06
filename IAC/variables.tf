# VPC CIDR range to create the VPC.
variable "vpc_cidr" {
  default = "172.26.0.0/16"
}

#Public Subnets CIDRs
variable "subnet_cidrs_public" {
  default = ["172.26.1.0/24", "172.26.2.0/24"]
  type    = list(any)
}
#Private Subnet CIDRs
variable "subnet_cidrs_private" {
  default = ["172.26.3.0/24", "172.26.4.0/24"]
  type    = list(any)
}

#Availibility Zones(Select any zones in EU_WEST_1)
variable "availability_zones" {
  default = ["ap-south-1a", "ap-south-1b"]
  type    = list(any)
}


#AMI id to launch Mage-Admin instances
variable "mage-ami" {
  default = "ami-0567e0d2b4b2169ae"
  type    = string
}

#AMI id to launch Bastion instance
variable "bastion" {
  default = "ami-0567e0d2b4b2169ae"
  type    = string
}

# Enivronment names like stage, qa, dev etc
#Note: provide the value in the small case letters. Because the DB cluster identifier #will not accept the Capital letters. 
variable "environment" {
  default = "Demo"
  type    = string
}

#SSH Key Pair Name for SSH 
variable "key_pair" {
  default = "g"
  type    = string
}

