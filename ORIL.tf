provider "aws" {
  access_key = "ACCESS"
  secret_key = "SECRET"
  region     = "eu-central-1"
}
resource "aws_instance" "oril" {
  ami                    = "ami-0d527b8c289b4af7f"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.test.id]

  tags = {
    Name        = "Terraform"
    Owner       = "ORIL"
    Environment = "test"
  }
}

resource "aws_security_group" "test" {
  name        = "Test"
  description = "22, 443, 8080"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
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

  tags = {
    Name        = "Security Group"
    Owner       = "ORIL"
    Environment = "test"
  }
}
