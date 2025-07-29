resource "google_storage_default_object_access_control" "nc" {
  bucket = google_storage_bucket.bucket-nc.name
  role   = "READER"
  entity = "allUsers"
}

resource "google_storage_bucket" "bucket-nc" {
  name     = "static-content-bucket-nc"
  location = "US"
}