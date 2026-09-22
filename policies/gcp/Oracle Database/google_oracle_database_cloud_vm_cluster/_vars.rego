package terraform.gcp.security.google_oracle_database_cloud_vm_cluster.vars

variables := {
    "friendly_resource_name": "Oracle Database Cloud VM Cluster", # Change this to the resource name, Ex: API Gateway IAM Policy
    "resource_type":  "google_oracle_database_cloud_vm_cluster",  # Change this to the Terraform resource type, Ex: google_api_gateway_gateway_iam_policy
    "resource_value_name" : "cloud_vm_cluster_id" # Change this to unique attribute name of the resource which is used to identify the resource in the policy violation message, Ex: gateway
}
