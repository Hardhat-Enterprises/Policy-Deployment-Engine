resource "google_storage_bucket" "c" {
  name     = "project-data-prod"
  location = "US"
  force_destroy = true
}
