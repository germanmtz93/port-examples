variable "ec2_name" {
  description = "Name tag for the EC2 instance. This will be displayed in the AWS console and used for identification."
  type        = string
}

variable "pem_key_name" {
  description = "Name of the AWS key pair to use for SSH access to the EC2 instance. Must exist in your AWS account."
  type        = string
}

variable "aws_region" {
  description = "AWS region where the EC2 instance will be deployed (e.g., us-west-2, eu-west-1)."
  type        = string
}

variable "ec2_instance_type" {
  description = "EC2 instance type to use (e.g., t3.micro, t3.small, m5.large). Defaults to t3.micro if not specified."
  type        = string
  default     = "t3.micro"
}