resource "google_storage_bucket" "compliant_example_1" {
  name          = "compliant_example_1"
  location      = "US"
  force_destroy = true

  retention_policy {
    retention_period = 604800 # 7 days
  }
}
