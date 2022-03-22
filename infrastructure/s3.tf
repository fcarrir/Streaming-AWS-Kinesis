resource "aws_s3_bucket" "stream" {
  bucket = "${var.base_bucket_name}-${var.environment}-${var.account_id}-tf"

  tags = {
    IES   = "IGTI",
    CURSO = "EDC"
  }
}

resource "aws_s3_bucket_acl" "acl" {
  bucket = aws_s3_bucket.stream.id
  acl    = "private"
}

resource "aws_s3_bucket_server_side_encryption_configuration" "encryption" {
  bucket = aws_s3_bucket.stream.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}