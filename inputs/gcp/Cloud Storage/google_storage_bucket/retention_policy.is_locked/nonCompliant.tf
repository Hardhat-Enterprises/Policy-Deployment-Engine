resource "google_storage_bucket" "non_compliant_example_1" {
  name     = "non_compliant_example_1"
  location = "AUSTRALIA-SOUTHEAST1"

  retention_policy {
    is_locked        = true
    retention_period = 3600
  }
}
