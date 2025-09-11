resource "google_storage_bucket" "nc123" {
  name     = "nc123"
  location = "AUSTRALIA-SOUTHEAST1"

  retention_policy {
    is_locked        = true
    retention_period = 3600
  }
}