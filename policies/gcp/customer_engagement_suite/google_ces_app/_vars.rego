package terraform.gcp.security.customer_engagement_suite.google_ces_app.vars

variables := {
    "friendly_resource_name": "GOOGLE CES APP", # Change this to the resource name, Ex: API Gateway IAM Policy
    "resource_type": "google_ces_app",  # Change this to the Terraform resource type, Ex: google_api_gateway_gateway_iam_policy
    "resource_value_name" : "app_id" # Change this to unique attribute name of the resource which is used to identify the resource in the policy violation message, Ex: gateway
}
