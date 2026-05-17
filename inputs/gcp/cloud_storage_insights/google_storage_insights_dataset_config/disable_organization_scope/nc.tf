resource "google_storage_insights_dataset_config" "nc" {
  location              = "australia-southeast1"
  dataset_config_id     = "insecure-config"
  retention_period_days = 30
  organization_scope    = true
  project               = "nc"

  identity {
    type = "IDENTITY_TYPE_PER_CONFIG"
  }
}