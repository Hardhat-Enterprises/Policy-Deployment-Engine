resource "google_storage_insights_dataset_config" "c" {
  location              = "australia-southeast1"
  dataset_config_id     = "secure-config"
  retention_period_days = 31
  project               = "c"
  source_projects {
    project_numbers = ["123456789"]
  }
  identity {
    type = "IDENTITY_TYPE_PER_CONFIG"
  }
}