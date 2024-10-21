resource "aws_instance" "app" {
  count           = 3
  ami             = "ami-01e3c4a339a264cc9"
  instance_type   = "t3.micro"
  key_name        = var.key_name
  security_groups = [aws_security_group.ec2.id]

  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo amazon-linux-extras install docker -y
              sudo service docker start
              sudo usermod -a -G docker ec2-user
              EOF

  tags = merge(var.tags, {
    Name     = "java-app-instance-${count.index + 1}"
    Category = "application"
  })
}
