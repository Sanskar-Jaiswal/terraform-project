resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-test-bucketdsvsdvlnrhlrslhmsrh" # must be globally unique

  tags = {
    Name        = "MyTerraformS3Bucket"
    Environment = "Dev"
  }
}