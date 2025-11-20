resource "aws_instance" "django" {
  ami           = var.ubuntu_ami
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_a.id
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  tags = {
    Name = "django-server"
  }
}
