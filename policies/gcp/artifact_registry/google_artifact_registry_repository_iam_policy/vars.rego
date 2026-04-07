package terraform.gcp.security.artifact_registry.google_artifact_registry_repository_iam_policy.vars

variables := {
    "friendly_resource_name": "Artifact Registry Repository IAM Policy", # Change this to the resource name, Ex: API Gateway IAM Policy
    "resource_type":  "google_artifact_registry_repository_iam_policy",  # Change this to the Terraform resource type, Ex: google_api_gateway_gateway_iam_policy
    "resource_value_name" : "name" # Change this to unique attribute name of the resource which is used to identify the resource in the policy violation message, Ex: gateway
}
