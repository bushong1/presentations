variable "ami_id" { type = string }
variable "server_name" { type = string }
variable "server_instance_type" { type = string }

resource "aws_instance" "server" {
  ami           = var.ami_id
  instance_type = var.server_instance_type

  tags = {
    Name = var.server_name
  }
}
