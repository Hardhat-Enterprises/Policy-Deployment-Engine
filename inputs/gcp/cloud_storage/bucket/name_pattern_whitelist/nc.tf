resource "google_storage_bucket" "nc" {
  name     = "misc-data-bucket"
  location = "US"
  force_destroy = true
}
