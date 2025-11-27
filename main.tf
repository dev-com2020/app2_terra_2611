resource "aws_instance" "web_server" {
  ami           = ""
  instance_type = "t2.micro"
  security_groups = [aws_security_group.web_server_sg.name]

  # Skrypt uruchamiany przy starcie instancji
  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "<h1>Wdrożono przez Terraform!</h1>" > /var/www/html/index.html
              EOF

  tags = {
    Name = "tk_WebServerInstance"
  }
}
