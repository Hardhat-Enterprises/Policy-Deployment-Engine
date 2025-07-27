# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_storage_bucket" "bucket_c" {
  name     = "example-bucket"
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

