resource "google_storage_insights_dataset_config" "non_compliant_example_1" {
  location              = "europe-west8"
  dataset_config_id     = "secure-config"
  retention_period_days = 30
  project               = "non_compliant_example_1"
  source_projects {
    project_numbers = ["123456789"]
  }
  identity {
    type = "IDENTITY_TYPE_PER_CONFIG"
  }
}
