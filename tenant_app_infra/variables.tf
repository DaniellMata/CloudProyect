variable "aws_region" {
  default = "us-east-2"
}

variable "ubuntu_ami" {
  default = "ami-0c02fb55956c7d316" # Ubuntu 22.04 us-east-2
}

variable "project_name" {
  default = "tenant-lab"
}

variable "db_username" {
  default = "postgres"
}

variable "db_password" {
  default = "Password123!"
}
