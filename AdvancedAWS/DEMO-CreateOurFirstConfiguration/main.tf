data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "appweb" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  user_data = filebase64("scripts/user_data.sh")

  tags = {
    Name = "HelloWorld"
  }
}