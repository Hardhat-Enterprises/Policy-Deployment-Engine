resource "google_storage_bucket" "nc" {
name = "nc"
location ="AUSTRALIA-SOUTHEAST1"

retention_policy {
  is_locked = true
  retention_period = 3600
}
}