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

  owners = ["099720109477"]
}

resource "aws_instance" "mtstec_moodle" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.small"

  key_name               = "mtstec"
  subnet_id              = aws_subnet.public-us-east-1a.id
  vpc_security_group_ids = [
    aws_security_group.mtstec_ssh_access.id,
    aws_security_group.mtstec_http_access.id,
    aws_security_group.mtstec_https_access.id
  ]

  associate_public_ip_address = true

  tags = {
    Name = "Mtstec Moodle"
  }
}
