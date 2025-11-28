resource "aws_s3_bucket" "ci_cd_bucket" {
  bucket = "tk00-my-terraform-ci-cd-bucket-example" 

  tags = {
    Name        = "tk_CiCdBucket"
    ManagedBy   = "tk_GitHubActions"
    version = "1.1.3"
  }
}