resource "google_storage_default_object_access_control" "nc123" {
  bucket = google_storage_bucket.bucket-nc.name
  role   = "READER"
  entity = "allUsers"
}

resource "google_storage_bucket" "bucket-nc" {
  name     = "nc123"
  location = "US"
}