resource "aws_s3_bucket" "terraform_state" {
  bucket = "micsvc-terraform-state-bucket"
  force_destroy = true

  tags = {
    Name        = "micsvc-terraform-state-bucket"
    Terraform   = "true"
    Environment = "dev"
  }
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.terraform_state.id
  versioning_configuration {
    status = "Enabled"
  }
}