resource "aws_instance" "app_server" {
  ami           = "ami-0a6793a25df710b06"
  instance_type = "t2.nano"

  tags = {
    Name = "TK_AppServerInstance"
  }
  
}
