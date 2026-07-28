resource "google_storage_bucket" "non_compliant_example_1" {
  name          = "non_compliant_example_1"
  location      = "US"
  force_destroy = true

  retention_policy {
    retention_period = 2692000
  }
}
