resource "google_storage_bucket" "bucket_nc" {
  name     = "example-bucket-nc"
  location = "US"
}

resource "google_storage_bucket_access_control" "nc" {
  bucket = google_storage_bucket.bucket_nc.name

  role   = "READER"
  entity = "allUsers"  
}
