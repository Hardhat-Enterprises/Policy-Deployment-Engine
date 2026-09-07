resource "google_storage_insights_dataset_config" "non_compliant_example_1" {
  location              = "australia-southeast1"
  dataset_config_id     = "secure-config"
  retention_period_days = 30
  organization_scope    = true
  project               = "non_compliant_example_1"

  identity {
    type = "IDENTITY_TYPE_PER_CONFIG"
  }
}
