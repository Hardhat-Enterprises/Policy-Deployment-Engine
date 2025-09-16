resource "google_storage_default_object_access_control" "c123" {
  bucket = google_storage_bucket.bucket.name
  role   = "READER"
  entity = "domain-example.com"
}

resource "google_storage_bucket" "bucket" {
  name     = "c123"
  location = "US"
}