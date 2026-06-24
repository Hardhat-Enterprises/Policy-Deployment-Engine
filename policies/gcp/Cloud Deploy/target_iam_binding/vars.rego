package terraform.gcp.security.deploy.target_iam_binding.vars

variables := {
    "friendly_resource_name": "Target IAM Binding", # eg., "GCS Bucket",
    "resource_type":  "google_clouddeploy_target_iam_binding", # eg., "google_storage_bucket"
    "resource_value_name" : "name" # eg., "name"
}
