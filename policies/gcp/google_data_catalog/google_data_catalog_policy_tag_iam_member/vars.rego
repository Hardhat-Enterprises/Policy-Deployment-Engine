package terraform.gcp.security.google_data_catalog.google_data_catalog_policy_tag_iam_member.vars

variables := {
    "friendly_resource_name": "Data Catalog Policy Tag IAM Member", # Change this to the resource name, Ex: API Gateway IAM Policy
    "resource_type":  "google_data_catalog_policy_tag_iam_member",  # Change this to the Terraform resource type, Ex: google_api_gateway_gateway_iam_policy
    "resource_value_name" : "name" # Change this to unique attribute name of the resource which is used to identify the resource in the policy violation message, Ex: gateway
}
