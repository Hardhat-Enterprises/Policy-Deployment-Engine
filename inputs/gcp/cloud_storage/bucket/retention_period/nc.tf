resource "google_storage_bucket" "nc" {
  name     = "nc"
  location = "US"
  force_destroy = true

  retention_policy {
    retention_period = 1209600  # 14 days (OK)
  }
}
