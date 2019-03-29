#
# Module: Creates Security groups to control access to Redshift
#

resource "aws_security_group" "main_redshift_access" {
  name        = "${var.cluster_identifier}-redshift-access"
  description = "Allow access to the cluster: ${var.cluster_identifier}"
  vpc_id      = "${var.redshift_vpc_id}"

  tags {
    
  }
tags {
    Name = "${var.cluster_identifier}-redshift-access"
    Team          = "${var.tag_team}"
    Application   = "${var.tag_application}"
    Environment   = "${var.tag_environment}"
    Contact-Email = "${var.tag_contact-email}"
    Customer      = "${var.tag_customer}"
  }
}

# Keep rules separated to not recreate the cluster when deleting/adding rules
resource "aws_security_group_rule" "allow_port_inbound" {
  type = "ingress"

  from_port   = "${var.cluster_port}"
  to_port     = "${var.cluster_port}"
  protocol    = "tcp"
  cidr_blocks = ["${var.private_cidr}"]

  security_group_id = "${aws_security_group.main_redshift_access.id}"
}

# Limiting outbound traffic to only resources in VPC's CIDR range.  Secure by design until requirements dictate opening access.
resource "aws_security_group_rule" "allow_all_outbound" {
  type = "egress"

  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["172.31.0.0/16"]

  security_group_id = "${aws_security_group.main_redshift_access.id}"
}