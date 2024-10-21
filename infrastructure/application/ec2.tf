resource "aws_instance" "app" {
  count                  = 3
  ami                    = "ami-01e3c4a339a264cc9"
  instance_type          = "t3.micro"
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.ec2.id]
  iam_instance_profile    = aws_iam_instance_profile.ec2_instance_profile.name

  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo amazon-linux-extras install docker -y
              sudo service docker start
              sudo usermod -a -G docker ec2-user

              sudo $(aws ecr get-login --no-include-email --region us-east-1)

              sudo docker pull 746669201677.dkr.ecr.us-east-1.amazonaws.com/address-service-development:95cefbf14ecaa149569f6f326bbe6692a7843578
              sudo docker run -d -p 8080:8080 746669201677.dkr.ecr.us-east-1.amazonaws.com/address-service-development:95cefbf14ecaa149569f6f326bbe6692a7843578
              EOF

  tags = merge(var.tags, {
    Name     = "java-app-instance-${count.index + 1}"
    Category = "application"
  })
}
