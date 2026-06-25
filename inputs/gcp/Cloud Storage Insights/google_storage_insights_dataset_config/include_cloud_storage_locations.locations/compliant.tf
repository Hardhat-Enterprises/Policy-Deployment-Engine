resource "google_storage_insights_dataset_config" "compliant_example_1" {
  location              = "australia-southeast1"
  dataset_config_id     = "secure-config"
  retention_period_days = 30
  project               = "compliant_example_1"
  source_projects {
    project_numbers = ["123456789"]
  }
  identity {
    type = "IDENTITY_TYPE_PER_CONFIG"
  }

  include_cloud_storage_locations {
    locations = ["australia-southeast1"]
  }
}
