resource "aws_key_pair" "ec2_key" {
  key_name   = "${var.env}-ec2-key"
  public_key = file(var.public_key_path)
}

resource "aws_instance" "web_server" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [var.security_group_id]
  key_name                    = aws_key_pair.ec2_key.key_name
  associate_public_ip_address = true
  user_data                   = file("${path.module}/user_data.sh")

  tags = {
    Name = "${var.env}-web-server"
  }
}
