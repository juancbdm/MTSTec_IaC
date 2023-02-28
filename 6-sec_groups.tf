resource "aws_security_group" "mtstec_ssh_access" {
  name        = "mtstec-ssh-access"
  description = "Allow SSH Accesss"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "Allow SSH from Anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_security_group" "mtstec_http_access" {
  name        = "mtstec-http-access"
  description = "Allow http Accesss"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "Allow http from Anywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_security_group" "mtstec_https_access" {
  name        = "mtstec-https-access"
  description = "Allow https Accesss"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "Allow https from Anywhere"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}