
output "redshift_cluster_database_name" {
  description = "The name of the default database in the Cluster"
  value       = "${aws_redshift_cluster.main_redshift_cluster.database_name}"
}

output "redshift_cluster_endpoint" {
  description = "The connection endpoint"
  value       = "${aws_redshift_cluster.main_redshift_cluster.endpoint}"
}

output "redshift_master_username" {
  description = "The connection endpoint"
  value       = "${aws_redshift_cluster.main_redshift_cluster.master_username}"
}

output "redshift_master_password" {
  description = "The connection endpoint"
  value       = "${aws_redshift_cluster.main_redshift_cluster.master_password}"
}

output "redshift_cluster_id" {
  description = "The Redshift cluster ID"
  value       = "${aws_redshift_cluster.main_redshift_cluster.id}"
}

output "redshift_cluster_version" {
  description = "The version of Redshift engine software"
  value       = "${aws_redshift_cluster.main_redshift_cluster.cluster_version}"
}

output "redshift_cluster_identifier" {
  description = "The Redshift cluster identifier"
  value       = "${aws_redshift_cluster.main_redshift_cluster.cluster_identifier}"
}

output "main_redshift_cluster_redshift_cluster_type" {
  description = "The Redshift cluster type"
  value       = "${aws_redshift_cluster.main_redshift_cluster.cluster_type}"
}

output "redshift_cluster_node_type" {
  description = "The type of nodes in the cluster"
  value       = "${aws_redshift_cluster.main_redshift_cluster.node_type}"
}

output "redshift_cluster_availability_zone" {
  description = "The availability zone of the Cluster"
  value       = "${aws_redshift_cluster.main_redshift_cluster.availability_zone}"
}

output "redshift_cluster_automated_snapshot_retention_period" {
  description = "The backup retention period"
  value       = "${aws_redshift_cluster.main_redshift_cluster.automated_snapshot_retention_period}"
}

output "redshift_cluster_preferred_maintenance_window" {
 description = "The backup window"
 value       = "${aws_redshift_cluster.main_redshift_cluster.preferred_maintenance_window}"
}

output "redshift_cluster_hostname" {
  description = "The hostname of the Redshift cluster"
  value       = "${replace(aws_redshift_cluster.main_redshift_cluster.endpoint, format(":%s", aws_redshift_cluster.main_redshift_cluster.port), "")}"
}

output "redshift_cluster_encrypted" {
 description = "Whether the data in the cluster is encrypted"
 value       = "${aws_redshift_cluster.main_redshift_cluster.encrypted}"
}

output "redshift_cluster_security_groups" {
  description = "The security groups associated with the cluster"
  value       = "${aws_redshift_cluster.main_redshift_cluster.cluster_security_groups}"
}

output "redshift_cluster_vpc_security_group_ids" {
  description = "The VPC security group ids associated with the cluster"
  value       = "${aws_redshift_cluster.main_redshift_cluster.vpc_security_group_ids}"
}

output "redshift_cluster_port" {
  description = "The port the cluster responds on"
  value       = "${aws_redshift_cluster.main_redshift_cluster.port}"
}

output "redshift_cluster_parameter_group_name" {
  description = "The name of the parameter group to be associated with main_redshift_cluster cluster"
  value       = "${aws_redshift_cluster.main_redshift_cluster.cluster_parameter_group_name}"
}

output "redshift_cluster_subnet_group_name" {
  description = "The name of a cluster subnet group to be associated with main_redshift_cluster cluster"
  value       = "${aws_redshift_cluster.main_redshift_cluster.cluster_subnet_group_name}"
}

output "redshift_cluster_public_key" {
  description = "The public key for the cluster"
  value       = "${aws_redshift_cluster.main_redshift_cluster.cluster_public_key}"
}

output "redshift_cluster_revision_number" {
  description = "The specific revision number of the database in the cluster"
  value       = "${aws_redshift_cluster.main_redshift_cluster.cluster_revision_number}"
}

output "redshift_subnet_group_id" {
  description = "The ID of Redshift subnet group created by main_redshift_cluster module"
  value       = "${element(concat(aws_redshift_subnet_group.main_redshift_subnet_group.*.id, list("")), 0)}"
}

output "redshift_parameter_group_id" {
  description = "The ID of Redshift parameter group created by main_redshift_cluster module"
  value       = "${element(concat(aws_redshift_parameter_group.main_redshift_cluster.*.id, list("")), 0)}"
}

output "user_arn" {
  value = "${aws_iam_user.user.arn}"
}

output "user_name" {
  value = "${aws_iam_user.user.name}" 
}

output "bucket_arn" {
  value = "${aws_s3_bucket.bucket.arn}"
}

output "bucket_name_id" {
  value = "${aws_s3_bucket.bucket.id}"
}

output "bucket_name" {
  value = "${aws_s3_bucket.bucket.bucket}"
}

output "iam_access_key_id" {
  value = "${aws_iam_access_key.user_keys.id}"
}

output "iam_access_key_secret" {
  value = "${aws_iam_access_key.user_keys.secret}"
}
