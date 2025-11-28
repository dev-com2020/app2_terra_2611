resource "aws_s3_bucket" "ci_cd_bucket" {
  bucket = "jenkins-tk0001-my-terraform-ci-cd-bucket-example" 

  tags = {
    Name        = "tk_CiCdBucket_2025"
    ManagedBy   = "tk_GitHubActions_final"
    version = "beta0.343alpha"
  }
}
