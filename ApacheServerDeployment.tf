## creating instance with user-defined SECURITY GROUP and running apache webserver

provider "aws" {
    access_key = "AWS ACCESS KEY"
    secret_key = "AWS SECRETE KEY"
    region = "us-east-1"
}

variable "public_key_path" {
  description = "Public key path"
  default = "~/.ssh/id_rsa.pub"
}

resource "aws_key_pair" "ec2key" {
  key_name = "publicKey"
  public_key = "${file(var.public_key_path)}"
}

## Security Group##
resource "aws_security_group" "terraform_private_sg" {
  description = "Allow limited inbound external traffic"
  name        = "terraform_ec2_private_sg"

  ingress {
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 22
    to_port     = 22
  }

  ingress {
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 80
    to_port     = 80
  }

  egress {
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    to_port     = 0
  }

  tags = {
    Name = "ec2-private-sg"
  }
}

output "aws_security_gr_id" {
  value = "${aws_security_group.terraform_private_sg.id}"
}

resource "aws_instance" "terraform_wapp" {
    ami = "ami-039a49e70ea773ffc"
    instance_type = "t2.micro"
    key_name               = "${aws_key_pair.ec2key.key_name}"
    count         = 1
    associate_public_ip_address = true
    tags = {
      Name              = "terraform_ec2_dev"
      Environment       = "development"
    }
}