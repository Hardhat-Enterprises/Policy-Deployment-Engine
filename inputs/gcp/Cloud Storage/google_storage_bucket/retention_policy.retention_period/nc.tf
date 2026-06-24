resource "google_storage_bucket" "nc123" {
  name          = "nc123"
  location      = "US"
  force_destroy = true

  retention_policy {
    retention_period = 2692000
  }
}
