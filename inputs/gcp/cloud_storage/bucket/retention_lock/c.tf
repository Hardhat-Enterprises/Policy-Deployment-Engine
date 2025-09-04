resource "google_storage_bucket" "c" {
name = "c"
location ="AUSTRALIA-SOUTHEAST1"

retention_policy {
  retention_period = 3600
}
}
