package terraform.gcp.security.cloud_storage_insights.google_storage_insights_dataset_config.vars

variables := {
    "friendly_resource_name": "google storage insights dataset config", # Change this to the resource name, Ex: API Gateway IAM Policy
    "resource_type":  "google_storage_insights_dataset_config",  # Change this to the Terraform resource type, Ex: google_api_gateway_gateway_iam_policy
    "resource_value_name" : "project" # Change this to unique attribute name of the resource which is used to identify the resource in the policy violation message, Ex: gateway
}