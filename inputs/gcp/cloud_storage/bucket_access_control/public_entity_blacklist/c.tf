resource "google_storage_bucket" "bucket_c" {
  name     = "c"
  location = "US"
}

resource "google_storage_bucket_access_control" "c" {
  bucket = google_storage_bucket.bucket_c.name

  role   = "READER"
  entity = "user:user@example.com"  # Approved entity
}
