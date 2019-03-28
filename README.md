# Redshift Cluster with S3 bucket

This terraform module builds upon the [terraform-community-modules](https://github.com/terraform-community-modules/tf_aws_redshift)

## Usage
1. Set up variables  `terraform.tfvars` file (as shown below)

## **Sample Inputs in terraform.tfvars**
```
Variables for vpc
aws_region                  = "us-west-2"
private_cidr                = ["10.10.0/16"]
redshift_vpc_id             = "vpc-1111111"
subnets                     = ["subnet-1111111","subnet-1111111","subnet-111111"]

Variables for redshift cluster
cluster_identifier          = "redshift-dev1"
cluster_node_type           = "dc2.large"
cluster_number_of_nodes     = "3"
cluster_database_name       = "rs_dev1"
cluster_master_username     = "admin_fake"
cluster_master_password     = "SuperSecret_fake"
lifecycle_prevent_destroy   = "false"
Enhanced_VPC_Routing      	= "true"
allow_version_upgrade       = "true"
final_snapshot_identifier   = "FinalSnapshot"
cluster_port                = "5493"

Variables for S3 bucket
bucket_name                 = "fake-redshift-data"
versioning                  = "true"

Variables for tagging resources
tag_team                    = "Cloud Operations"
tag_application             = "Big Red"
tag_environment             = "Development"
tag_contact-email           = "big.red@domain.com"
tag_customer                = "Data Team"
```

2. Run terraform init, plan and apply to build.

## Resources
```
  - aws_iam_access_key.user_keys
  - aws_iam_role.redshift_s3readonlyaccess_role
  - aws_iam_role_policy.redshift_s3readonlyaccess
  - aws_iam_user.user
  - aws_redshift_cluster.main_redshift_cluster
  - aws_redshift_parameter_group.main_redshift_cluster
  - aws_redshift_subnet_group.main_redshift_subnet_group
  - aws_s3_bucket.bucket
  - aws_s3_bucket_policy.bucket_policy
  - aws_s3_bucket_public_access_block.bucket_public_access
  - aws_security_group.main_redshift_access
  - aws_security_group_rule.allow_all_outbound
  - aws_security_group_rule.allow_port_inbound
  ````