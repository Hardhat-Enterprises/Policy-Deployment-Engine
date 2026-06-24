package terraform.gcp.security.deploy.target_iam_policy.vars


variables := {
    "friendly_resource_name": "Target IAM Policy", # eg., "GCS Bucket",
    "resource_type":  "google_clouddeploy_target_iam_policy", # eg., "google_storage_bucket"
    "resource_value_name" : "name" # eg., "name"
}
