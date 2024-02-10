variable "aws_region" {
  description = "The AWS region to deploy resources into"
  type        = string
  default     = "us-east-2"
}

variable "instance_type" {
  description = "The type of EC2 instance to create"
  type        = string
  default     = "t2.micro"
}

variable "vpc_name" {
  type    = string
  default = "project_vpc"
}

variable "allowed_ports" {
  type    = list(any)
  default = ["22", "80", "443", "9000"]
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "subnet_cidr_block" {
  description = "CIDR block for the subnet"
  type        = string
}

variable "availability_zone" {
  description = "Availability zone for the subnet"
  type        = string
}

variable "env_prefix" {
  description = "Prefix for resource names to denote environment"
  type        = string
}

variable "public_key_path" {
  description = "Path to the public SSH key file"
  type        = string
}

variable "myip_address" {
  description = "Your public IP address for SSH access"
  type        = string
}
