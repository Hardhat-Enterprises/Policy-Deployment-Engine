resource "google_storage_bucket" "nc" {
name = "gcp-test-bucket-nc"
location ="AUSTRALIA-SOUTHEAST1"

retention_policy {
  is_locked = true
  retention_period = 3600
}
}