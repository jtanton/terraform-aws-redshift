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

## **Outputs:**

bucket_name = fake-redshift-data
bucket_name_id = fake-redshift-data
iam_access_key_id = AKIAVxxxxxx
iam_access_key_secret = vOQyExxxxxxx
main_redshift_cluster_redshift_cluster_type = multi-node
redshift_cluster_automated_snapshot_retention_period = 0
redshift_cluster_availability_zone = us-west-2b
redshift_cluster_database_name = rs_dev1
redshift_cluster_encrypted = false
redshift_cluster_endpoint = redshift-dev1.cbxxxx6in.us-west-2.redshift.amazonaws.com:5493
redshift_cluster_hostname = redshift-dev1.cbxxxx6in.us-west-2.redshift.amazonaws.com
redshift_cluster_id = redshift-dev1
redshift_cluster_identifier = redshift-dev1
redshift_cluster_node_type = dc2.large
redshift_cluster_parameter_group_name = redshift-dev1-redshift-1-0-custom-params
redshift_cluster_port = 5493
redshift_cluster_preferred_maintenance_window = sat:10:00-sat:10:30
redshift_cluster_public_key = ssh-rsa Axxxxxxxxx...P9N Amazon-Redshift

redshift_cluster_revision_number = 6761
redshift_cluster_security_groups = []
redshift_cluster_subnet_group_name = redshift-dev1-redshift-subnetgrp
redshift_cluster_version = 1.0
redshift_cluster_vpc_security_group_ids = [
    sg-014xxx85f3ce
]
redshift_master_password = SuperSecret_fake
redshift_master_username = admin_fake
redshift_parameter_group_id = redshift-dev1-redshift-1-0-custom-params
redshift_subnet_group_id = redshift-dev1-redshift-subnetgrp
user_arn = arn:aws:iam::405882323047:user/srv_fox-redshift-data
user_name = srv_fox-redshift-data