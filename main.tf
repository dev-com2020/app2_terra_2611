resource "aws_s3_bucket" "ci_cd_bucket" {
  bucket = "tk000-my-terraform-ci-cd-bucket-example" 

  tags = {
    Name        = "tk_CiCdBucket"
    ManagedBy   = "tk_GitHubActions"
    version = "2.1.3"
  }
}