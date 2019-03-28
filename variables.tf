# Modules supported by this variables file.
#          provider.tf  - AWS
#          main.tf      - redshift cluster
#          s3.tf        - s3 bucket
#          sg.tf        - iam and security groups

#aws provider
variable "aws_region" {}

# Redshift Cluster Variables
variable "cluster_identifier" {
  description = "Custom name of the cluster"
}

variable "cluster_version" {
  description = "Version of Redshift engine cluster"
  default     = "1.0"

  # Constraints: Only version 1.0 is currently available.
  # http://docs.aws.amazon.com/cli/latest/reference/redshift/create-cluster.html
}

variable "cluster_node_type" {
  description = "Node Type of Redshift cluster"

  # Valid Values: ds2.xlarge | ds2.8xlarge | ds2.xlarge | ds2.8xlarge | dc1.large | dc1.8xlarge | dc2.large | dc2.8xlarge.
  # http://docs.aws.amazon.com/cli/latest/reference/redshift/create-cluster.html
}

variable "cluster_number_of_nodes" {
  description = "Number of Node in the cluster"
  default     = 3
}

variable "cluster_database_name" {
  description = "The name of the database to create"
}

variable "cluster_master_username" {}

variable "cluster_master_password" {}

variable "cluster_port" {
  description = "Custom cluster database access port. Replacing default port for security reasons."
}

variable "cluster_parameter_group" {
  description = "Parameter group, depends on DB engine used"
  default     = "redshift-1.0"
}

variable "encrypted" {
  description = "(Optional) If true , the data in the cluster is encrypted at rest."
  default     = false
  
}

variable "kms_key_id" {
  description = "(Optional) The ARN for the KMS encryption key. When specifying kms_key_id, encrypted needs to be set to true."
  default     = ""
}

variable "enhanced_vpc_routing" {
  description = "(Optional) If true, enhanced VPC routing is enabled."
  default     = true
}

variable "require_ssl" {
  description = "Require SSL to connect to this cluster"
  default     = true
}

variable "use_fips_ssl" {
  description = "Enable FIPS-compliant SSL mode only if your system is required to be FIPS compliant."
  default     = false
}

variable "enable_user_activity_logging" {
  description = "Enable logging of user activity. See https://docs.aws.amazon.com/redshift/latest/mgmt/db-auditing.html"
  default     = false
}

variable "enable_logging" {
  description = "Enables logging information such as queries and connection attempts"
  default     = false
}

# logging_bucket_name - Enhance later time permitting
variable "logging_bucket_name" {
  description = " (Optional, required when enable_logging is true) The name of an existing S3 bucket where the log files are to be stored. Must be in the same region as the cluster and the cluster must have read bucket and put object permissions."
  default = ""
}

# logging_s3_key_prefix - Enhance later time permitting
variable "logging_s3_key_prefix" {
  description = "(Optional) The prefix applied to the log file names."
  default = ""
}

variable "lifecycle_prevent_destroy" {
  type = "string"
}

variable "cluster_iam_roles" {
  description = "A list of IAM Role ARNs to associate with the cluster. A Maximum of 10 can be associated to the cluster at any time."
  type        = "list"
  default     = [] 
}

variable "publicly_accessible" {
  description = "Determines if Cluster can be publicly available (NOT recommended)"
  default     = false
}

variable "subnets" {
  description = "List of subnets DB should be available at. It might be one subnet."
  type        = "list"
}

variable "private_cidr" {
  description = "VPC private addressing, used for a security group"
  type        = "list"
}

variable "redshift_vpc_id" {
  description = "VPC to connect to, used for a security group"
  type        = "string"
}

variable "skip_final_snapshot" {
  description = "If true (default), no snapshot will be made before deleting DB"
  default     = true
}

variable "final_snapshot_identifier" {}
variable "allow_version_upgrade" {}

variable "preferred_maintenance_window" {
  description = "When AWS can run snapshot, can't overlap with maintenance window"
  default     = "sat:10:00-sat:10:30"
}

variable "automated_snapshot_retention_period" {
  type        = "string"
  description = "How long will we retain backups"
  default     = 0
}

variable "wlm_json_configuration" {
  default = "[{\"query_concurrency\": 5}]"
}

variable "bucket_name" {
  default = "myredshift_bucket"
}

variable "versioning" {
  description = "A state of versioning. Versioning is a means of keeping multiple variants of an object in the same bucket."
  default     = "enabled"
}

# tags
variable "tag_team" {}

variable "tag_application" {}
variable "tag_environment" {}
variable "tag_contact-email" {}
variable "tag_customer" {}
