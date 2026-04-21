package terraform.gcp.security.<service>.<resource_type>.vars

variables := {
    "friendly_resource_name": "Cloud_AI_Notebooks", 
    "resource_type":  "google_workbench_instance",  # Change this to the Terraform resource type, Ex: google_api_gateway_gateway_iam_policy
    "resource_value_name" : "Vertex AI" # Change this to unique attribute name of the resource which is used to identify the resource in the policy violation message, Ex: gateway
}
