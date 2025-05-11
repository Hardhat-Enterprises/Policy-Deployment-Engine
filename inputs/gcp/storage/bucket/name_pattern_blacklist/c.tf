resource "google_storage_bucket" "c" {
  name     = "production-bucket"
  location = "US"
  force_destroy = true
}
