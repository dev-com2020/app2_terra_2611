resource "aws_instance" "web_server" {
  ami           = "ami-0a6793a25df710b06"
  instance_type = "t2.micro"
  security_groups = [aws_security_group.web_server_sg.name]

  # Skrypt uruchamiany przy starcie instancji
  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "<h2>Strona została zaktualizowana !</h2>" > /var/www/html/index.html
              EOF

  user_data_replace_on_change = true

  tags = {
    Name = "tk_WebServerInstance"
  }
}
