resource "google_storage_bucket" "bucket_c" {
  name     = "c"
  location = "AU"
}

resource "google_storage_bucket_acl" "c" {
  bucket = google_storage_bucket.bucket_c.name

  role_entity = [
    "user:user@example.com",
    "group:admin@example.com",
    "domain:example.com"
  ]
}

