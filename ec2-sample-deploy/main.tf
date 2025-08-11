# Data source to get the latest Ubuntu 20.04 LTS AMI
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/*20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  owners = ["099720109477"] # Canonical
}

# Configure the AWS Provider
provider "aws" {
  region = var.aws_region
}

# Create the EC2 instance
resource "aws_instance" "app_server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.ec2_instance_type
  key_name      = var.pem_key_name

  # Enable detailed monitoring
  monitoring = true

  # Add tags for better resource management
  tags = {
    Name        = var.ec2_name
    Environment = "development"
    Project     = "port-examples"
    ManagedBy   = "terraform"
    CreatedBy   = "port-workflow"
  }
}
