
resource "aws_iam_role" "redshift_s3readonlyaccess_role" {
  name = "${var.cluster_identifier}_role"
  
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "s3.amazonaws.com"
      },
      "Effect": "Allow" 
    }
  ]
}
EOF

tags {
    Team          = "${var.tag_team}"
    Application   = "${var.tag_application}"
    Environment   = "${var.tag_environment}"
    Contact-Email = "${var.tag_contact-email}"
    Customer      = "${var.tag_customer}"
  }
}
