# Configure the AWS Provider
provider "aws" {
  region  = var.aws_region  # Use variable for AWS region
  profile = "dev_admin"     # AWS CLI profile name
}

# Resource: AWS Key Pair
resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"                     # Name for the key pair in AWS
  public_key = file(var.public_key_path)          # Reads the public key from a file
}

# Resource: AWS VPC
resource "aws_vpc" "app_vpc" {
  cidr_block = var.vpc_cidr_block                 # Use variable for VPC CIDR block
  tags = {
    Name = "${var.env_prefix}-vpc"
  }
}

# Resource: AWS Subnet
resource "aws_subnet" "app_subnet" {
  vpc_id            = aws_vpc.app_vpc.id
  cidr_block        = var.subnet_cidr_block       # Use variable for subnet CIDR block
  availability_zone = var.availability_zone       # Use variable for availability zone
  tags = {
    Name = "${var.env_prefix}-subnet"
  }
}

# Resource: AWS Internet Gateway
resource "aws_internet_gateway" "app_igw" {
  vpc_id = aws_vpc.app_vpc.id
  tags = {
    Name = "${var.env_prefix}-igw"
  }
}

# Resource: AWS Default Route Table
resource "aws_default_route_table" "main_route_table" {
  default_route_table_id = aws_vpc.app_vpc.default_route_table_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.app_igw.id
  }
  tags = {
    Name = "${var.env_prefix}-main-rtb"
  }
}

# Resource: AWS Default Security Group
resource "aws_default_security_group" "default_sg" {
  vpc_id = aws_vpc.app_vpc.id
  ingress {
    protocol    = "tcp"
    from_port   = 9000
    to_port     = 9000
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    protocol    = "tcp"
    from_port   = 8080
    to_port     = 8080
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = [var.myip_address]
  }
  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "${var.env_prefix}-default-sg"
  }
}

# Resource: AWS EC2 Instance
resource "aws_instance" "app_server" {
  ami                         = "ami-05fb0b8c1424f266b"  # Example AMI ID, ensure it's valid for your region
  instance_type               = var.instance_type        # Use variable for instance type
  vpc_security_group_ids      = [aws_default_security_group.default_sg.id]
  subnet_id                   = aws_subnet.app_subnet.id
  availability_zone           = var.availability_zone
  associate_public_ip_address = true
  key_name                    = aws_key_pair.deployer.key_name
  tags = {
    Name = "${var.env_prefix}-server"
  }
}

# Output: EC2 Public IP
output "ec2_public_ip" {
  value = aws_instance.app_server.public_ip
}
