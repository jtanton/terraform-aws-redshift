#
# Module: Creates S3 bucket, bucket policy, and blocks public access.
#


# create an s3 bucket
resource "aws_s3_bucket" "bucket" {

  bucket          = "${var.bucket_name}"
  force_destroy   = "true"
  acl             = "private"

  versioning {
    enabled       = "${var.versioning}"
  }

  tags {
    Team          = "${var.tag_team}"
    Application   = "${var.tag_application}"
    Environment   = "${var.tag_environment}"
    Contact-Email = "${var.tag_contact-email}"
    Customer      = "${var.tag_customer}"
  }
}

# Manages S3 bucket-level Public Access Block configuration
resource "aws_s3_bucket_public_access_block" "bucket_public_access" {
  bucket = "${aws_s3_bucket.bucket.id}"

  block_public_acls   = true
  block_public_policy = true
}

# Allows Read and Write Access to Objects in an S3 Bucket
resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = "${aws_s3_bucket.bucket.id}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AllowObjectActions",
      "Effect": "Allow",
      "Principal": {
        "AWS": "${aws_iam_user.user.arn}"
      },
      "Action": [ "s3:*Object" ],
      "Resource": [
        "${aws_s3_bucket.bucket.arn}",
        "${aws_s3_bucket.bucket.arn}/*"
      ]
    },
    {
      "Sid": "ListObjectsInBucket",
      "Effect": "Allow",
      "Principal": {
        "AWS": "${aws_iam_user.user.arn}"
      },
      "Action": [ "s3:ListBucket" ],
      "Resource": [
        "${aws_s3_bucket.bucket.arn}",
        "${aws_s3_bucket.bucket.arn}/*"
      ]
    }
  ]
}
EOF
}