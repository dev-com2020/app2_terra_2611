resource "aws_s3_bucket" "ci_cd_bucket" {
  bucket = "jenkins-tk0001-my-terraform-ci-cd-bucket-example" 

  tags = {
    Name        = "tk_CiCdBucket"
    ManagedBy   = "tk_GitHubActions_final"
    version = "28.1.3"
  }
}