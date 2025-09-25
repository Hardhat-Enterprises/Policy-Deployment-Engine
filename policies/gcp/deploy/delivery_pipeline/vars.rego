package terraform.gcp.security.deploy.delivery_pipeline.vars


variables := {
    "friendly_resource_name": "GCS Delivery Pipeline", # eg., "GCS Bucket",
    "resource_type":  "google_clouddeploy_delivery_pipeline", # eg., "google_storage_bucket"
    "resource_value_name" : "name" # eg., "name"
}
