provider "aws" {
  region = "us-east-1" # substitua pela região desejada
}

resource "aws_instance" "java_server" {
  ami           = "ami-0c55b159cbfafe1f0" # AMI Amazon Linux 2
  instance_type = "t2.micro" # tipo da instância

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y java-1.8.0-openjdk
              EOF

  tags = {
    Name = "JavaServer"
  }
}

output "instance_id" {
  value = aws_instance.java_server.id
}

output "public_ip" {
  value = aws_instance.java_server.public_ip
}

output "public_dns" {
  value = aws_instance.java_server.public_dns
}
