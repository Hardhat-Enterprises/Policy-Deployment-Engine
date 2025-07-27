resource "google_storage_bucket" "nc" {
  name     = "test-bucket-dev"
  location = "US"
  force_destroy = true
}
