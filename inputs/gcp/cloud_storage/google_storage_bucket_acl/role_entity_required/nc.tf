resource "google_storage_bucket" "bucket_nc" {
  name     = "nc123"
  location = "AU"
}

resource "google_storage_bucket_acl" "nc123" {
  bucket = google_storage_bucket.bucket_nc.name

  role_entity = [
    "OWNER:allUsers",
    "user:unauthorized@example.com"
  ]
}
