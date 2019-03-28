#
# Module: 
# - An Redshift cluster
# - A Redshift subnet group
# - A Redshift parameter group

# aws_redshift_cluster
resource "aws_redshift_cluster" "main_redshift_cluster" {
  cluster_identifier = "${var.cluster_identifier}"
  cluster_version    = "${var.cluster_version}"
  node_type          = "${var.cluster_node_type}"
  number_of_nodes    = "${var.cluster_number_of_nodes}"
  cluster_type       = "${var.cluster_number_of_nodes > 1 ? "multi-node" : "single-node" }"
  database_name      = "${var.cluster_database_name}"
  master_username    = "${var.cluster_master_username}"
  master_password    = "${var.cluster_master_password}"

  port = "${var.cluster_port}"

  vpc_security_group_ids        = ["${aws_security_group.main_redshift_access.id}"]
  cluster_subnet_group_name     = "${aws_redshift_subnet_group.main_redshift_subnet_group.name}"
  cluster_parameter_group_name  = "${aws_redshift_parameter_group.main_redshift_cluster.id}"
  publicly_accessible           = "${var.publicly_accessible}"

  skip_final_snapshot                 = "${var.skip_final_snapshot}"
  automated_snapshot_retention_period = "${var.automated_snapshot_retention_period }"
  preferred_maintenance_window        = "${var.preferred_maintenance_window}"
  final_snapshot_identifier           = "${var.final_snapshot_identifier}"
  allow_version_upgrade               = "${var.allow_version_upgrade}"

  iam_roles       = ["${var.cluster_iam_roles}"]

  encrypted       = "${var.encrypted}"
  kms_key_id      = "${var.kms_key_id}"

  enhanced_vpc_routing = "${var.enhanced_vpc_routing}"

  logging {
    enable        = "${var.enable_logging}"
    bucket_name   = "${var.logging_bucket_name}"
    s3_key_prefix = "${var.logging_s3_key_prefix}"
  }

  lifecycle {
    prevent_destroy = "false"
  }
  
  tags {
    Team          = "${var.tag_team}"
    Application   = "${var.tag_application}"
    Environment   = "${var.tag_environment}"
    Contact-Email = "${var.tag_contact-email}"
    Customer      = "${var.tag_customer}"
  }
}

# aws_redshift_parameter_group
resource "aws_redshift_parameter_group" "main_redshift_cluster" {
  name   = "${var.cluster_identifier}-${replace(var.cluster_parameter_group, ".", "-")}-custom-params"
  family = "${var.cluster_parameter_group}"

  parameter {
    name  = "wlm_json_configuration"
    value = "${var.wlm_json_configuration}"
  }

  parameter {
    # ref: https://docs.aws.amazon.com/redshift/latest/mgmt/connecting-ssl-support.html
    name  = "require_ssl"
    value = "${var.require_ssl}"
  }

  parameter {
    name  = "use_fips_ssl"
    value = "${var.use_fips_ssl}"
  }

  parameter {
    # ref: https://docs.aws.amazon.com/redshift/latest/mgmt/db-auditing.html
    name  = "enable_user_activity_logging"
    value = "${var.enable_user_activity_logging}"
  }
  
}

# aws_redshift_subnet_group
resource "aws_redshift_subnet_group" "main_redshift_subnet_group" {
  name            = "${var.cluster_identifier}-redshift-subnetgrp"
  description     = "Redshift subnet group of ${var.cluster_identifier}"
  subnet_ids      = ["${var.subnets}"]

  tags {
    Team          = "${var.tag_team}"
    Application   = "${var.tag_application}"
    Environment   = "${var.tag_environment}"
    Contact-Email = "${var.tag_contact-email}"
    Customer      = "${var.tag_customer}"
  }

}

