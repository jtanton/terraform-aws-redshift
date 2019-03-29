#
# Module: Creates bucket policy to allow Read and Write Access to Objects in an S3 Bucket
#

resource "aws_iam_role_policy" "redshift_s3readonlyaccess" {
  name = "${var.cluster_identifier}_policy"
  role = "${aws_iam_role.redshift_s3readonlyaccess_role.id}"
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": ["s3:ListBucket"],
      "Resource": ["arn:aws:s3:::${var.bucket_name}"]
    },
    {
      "Effect": "Allow",
      "Action": [
        "s3:*Object"
      ],
      "Resource": ["arn:aws:s3:::${var.bucket_name}/*"]
    }
  ]  
}
EOF
  
}
