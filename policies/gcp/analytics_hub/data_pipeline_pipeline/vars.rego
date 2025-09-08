package terraform.gcp.security.data_pipeline.pipeline

variables := {
    "friendly_resource_name": "Data Pipeline Pipeline",
    "resource_type": "google_data_pipeline_pipeline",
    "resource_value_name": "display_name",
    "allowed_regions": ["us-central1"],
    "required_type": "PIPELINE_TYPE_BATCH"
}
