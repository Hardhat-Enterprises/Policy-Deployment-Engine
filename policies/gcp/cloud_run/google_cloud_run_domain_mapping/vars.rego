package terraform.gcp.security.cloud_run.google_cloud_run_domain_mapping.vars

variables := {
    "friendly_resource_name": "Cloud Run Domain Mapping Location", # Change this to the resource name, Ex: API Gateway IAM Policy
    "resource_type":  "google_cloud_run_domain_mapping",  # Change this to the Terraform resource type, Ex: google_api_gateway_gateway_iam_policy
    "resource_value_name" : "name" # Change this to unique attribute name of the resource which is used to identify the resource in the policy violation message, Ex: gateway
}
