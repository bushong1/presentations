locals {
  app_name = "hello-world"
}

data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "my_server" {
  count         = 5
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

  tags = {
    Name = "${local.app_name}-${count.index}"
  }
}

locals {
  server_names = [
    "dog",
    "cat",
    "lizard",
  ]
}
resource "aws_instance" "my_server_named_better" {
  count         = 3
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

  tags = {
    Name = "my-server-${local.server_names[count.index]}"
  }
}

