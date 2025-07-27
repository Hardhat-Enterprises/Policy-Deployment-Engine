# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_storage_bucket" "bucket_nc" {
  name     = "nc_example-bucket"
  location = "AU"
}

resource "google_storage_bucket_acl" "nc" {
  bucket = google_storage_bucket.bucket_nc.name

  role_entity = [
    "allUsers",
    "user:unauthorized@example.com"
  ]
}
