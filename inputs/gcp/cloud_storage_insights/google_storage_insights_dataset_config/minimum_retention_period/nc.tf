resource "google_storage_insights_dataset_config" "nc" {
  location              = "australia-southeast1"
  dataset_config_id     = "insecure-config"
  retention_period_days = 1
  project               = "nc"
  source_projects {
    project_numbers = ["123456789"]
  }
  identity {
    type = "IDENTITY_TYPE_PER_CONFIG"
  }
}