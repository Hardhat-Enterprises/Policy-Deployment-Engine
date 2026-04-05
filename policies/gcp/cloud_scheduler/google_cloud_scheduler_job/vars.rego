package terraform.gcp.security.cloud_scheduler.google_cloud_scheduler_job.vars

variables := {
    "friendly_resource_name": "google_cloud_scheduler_job", # Change this to the resource name, Ex: API Gateway IAM Policy
    "resource_type":  "google_cloud_scheduler_job",  # Change this to the Terraform resource type, Ex: google_api_gateway_gateway_iam_policy
    "resource_value_name" : "name" # Change this to unique attribute name of the resource which is used to identify the resource in the policy violation message, Ex: gateway
}
