resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-test-bucketdsvsdvlnrhlrslhmsrh" # must be globally unique

  tags = {
    Name        = "MyTerraformS3Bucqwdqwdwdwdket"
    Environment = "Dev"
  }
}
# 2. Disable block public access
resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket = aws_s3_bucket.my_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}
# 3. Bucket Policy (Allow public read of objects)
resource "aws_s3_bucket_policy" "bucket_policy"{
    bucket = aws_s3_bucket.my_bucket.id
    
    policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
        {
            Sid = "PublicReadGetObject"
            Effect = "Allow"
            Principal = "*"
            Action = "s3:GetObject"
            Resource = "${aws_s3_bucket.my_bucket.arn}/*"
        }
        ]
    })
}
# 4. Enable Website Hosting
resource "aws_s3_bucket_website_configuration" "website_config" {
  bucket = aws_s3_bucket.my_bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}