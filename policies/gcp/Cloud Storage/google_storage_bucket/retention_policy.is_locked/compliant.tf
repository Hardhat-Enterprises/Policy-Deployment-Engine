resource "google_storage_bucket" "compliant_example_1" {
  name     = "compliant_example_1"
  location = "AUSTRALIA-SOUTHEAST1"

  retention_policy {
    retention_period = 3600
  }
}
