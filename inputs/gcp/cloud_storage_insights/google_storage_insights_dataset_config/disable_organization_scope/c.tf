resource "google_storage_insights_dataset_config" "c" {
  location              = "australia-southeast1"
  dataset_config_id     = "secure-config"
  retention_period_days = 30
  organization_scope    = false
  project               = "c"

  identity {
    type = "IDENTITY_TYPE_PER_CONFIG"
  }
}