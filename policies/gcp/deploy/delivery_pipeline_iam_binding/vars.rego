package terraform.gcp.security.deploy.delivery_pipeline_iam_binding.vars

variables := {
    "friendly_resource_name": "Cloud Deploy Delivery Pipeline IAM Binding", # eg., "GCS Bucket",
    "resource_type":  "google_clouddeploy_delivery_pipeline_iam_binding", # eg., "google_storage_bucket"
    "resource_value_name" : "name" # eg., "name"
}
