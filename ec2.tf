resource "aws_instance" "web" {
  count         = length(var.public_subnets)
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.public_subnets[count.index].id
  security_groups = [aws_security_group.web_sg.name]
  associate_public_ip_address = true

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl enable httpd
              systemctl start httpd
              echo "<h1>Terraform AWS Web Server ${count.index + 1}</h1>" > /var/www/html/index.html
              EOF

  tags = {
    Name = "web-${count.index + 1}"
  }
}
