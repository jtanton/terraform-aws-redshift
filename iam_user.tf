#
# Module iam - creates service account (user) for s3 access from redshift and access keys
#

# service account to upload to S3
resource "aws_iam_user" "user" {
  name = "srv_${var.bucket_name}"
}

resource "aws_iam_access_key" "user_keys" {
  user = "${aws_iam_user.user.name}"
}
