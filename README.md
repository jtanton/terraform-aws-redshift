# terraform-aws-redshift
## Terraform module to create a Redshift cluster and an S3 bucket

## **Sample Inputs in terraform.tfvars**

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

