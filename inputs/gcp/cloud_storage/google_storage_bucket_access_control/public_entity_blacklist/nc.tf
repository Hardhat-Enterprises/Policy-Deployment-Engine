resource "google_storage_bucket" "bucket_nc" {
  name     = "nc123"
  location = "US"
}

resource "google_storage_bucket_access_control" "nc123" {
  bucket = google_storage_bucket.bucket_nc.name

  role   = "READER"
  entity = "allUsers"
}
