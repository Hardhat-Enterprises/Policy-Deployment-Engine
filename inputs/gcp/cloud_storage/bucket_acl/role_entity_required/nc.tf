resource "google_storage_bucket" "bucket_nc" {
  name     = "nc"
  location = "AU"
}

resource "google_storage_bucket_acl" "nc" {
  bucket = google_storage_bucket.bucket_nc.name

  role_entity = [
    "allUsers",
    "user:unauthorized@example.com"
  ]
}
