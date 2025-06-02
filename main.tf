resource "aws_key_pair" "tf_key" {
  key_name   = "tf_key1"
  public_key = file("tf_key.pub.pub")
}
resource "aws_default_vpc" "default" {

}

resource "aws_security_group" "my_security_group" {
  name        = "tf_security_group"
  description = "Terraform learning with SG"
  vpc_id      = aws_default_vpc.default.id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "allow SSH"
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "allow SSH"
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "allow outbond"
  }
}

resource "aws_instance" "tf_test_instance" {
  key_name        = "tf"
  security_groups = [aws_security_group.my_security_group.name]
  instance_type   = var.ec2_instance_type
  ami             = "ami-06b6e5225d1db5f46"
  user_data = file("install_nginx.sh")

  root_block_device {
    volume_size = 15
    volume_type = "gp3"
  }
  tags = {
    Name = "tf-learnings"
  }
}

