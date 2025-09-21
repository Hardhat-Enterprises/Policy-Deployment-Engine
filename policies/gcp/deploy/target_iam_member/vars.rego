package terraform.gcp.security.deploy.target_iam_member.vars

variables := {
    "friendly_resource_name": "Target IAM Member", # eg., "GCS Bucket",
    "resource_type":  "google_clouddeploy_target_iam_member", # eg., "google_storage_bucket"
    "resource_value_name" : "name" # eg., "name"
}
