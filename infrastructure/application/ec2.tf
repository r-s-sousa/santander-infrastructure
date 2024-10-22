resource "aws_instance" "app" {
  count                  = 3
  ami                    = "ami-01e3c4a339a264cc9"
  instance_type          = "t3.micro"
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.ec2.id]
  iam_instance_profile   = aws_iam_instance_profile.ec2_instance_profile.name

  user_data = "#!/bin/bash\nsudo /home/ec2-user/setup.sh"

  tags = merge(var.tags, {
    Name     = "java-app-instance-${count.index + 1}"
    Category = "application"
  })
}
