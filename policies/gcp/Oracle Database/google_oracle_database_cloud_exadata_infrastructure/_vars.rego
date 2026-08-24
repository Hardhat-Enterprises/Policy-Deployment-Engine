package terraform.gcp.security.oracle_database.google_oracle_database_cloud_exadata_infrastructure.vars

variables := {
    "friendly_resource_name": "Oracle Database Cloud Exadata Infrastructure", # Change this to the resource name, Ex: API Gateway IAM Policy
    "resource_type":  "google_oracle_database_cloud_exadata_infrastructure",  # Change this to the Terraform resource type, Ex: google_api_gateway_gateway_iam_policy
    "resource_value_name" : "cloud_exadata_infrastructure_id" # Change this to unique attribute name of the resource which is used to identify the resource in the policy violation message, Ex: gateway
}
