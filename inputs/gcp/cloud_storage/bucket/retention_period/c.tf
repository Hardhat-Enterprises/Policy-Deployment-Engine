resource "google_storage_bucket" "c" {
  name     = "c"
  location = "US"
  force_destroy = true

  retention_policy {
    retention_period = 604800  # 7 days
  }
}
