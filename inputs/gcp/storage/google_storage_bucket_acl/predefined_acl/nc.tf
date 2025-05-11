resource "google_storage_bucket" "nc" {
  name     = "noncompliant-bucket"
  location = "US"
}

resource "google_storage_bucket_acl" "nc" {
  bucket         = google_storage_bucket.nc.name
  predefined_acl = "publicRead"  # 🚫
}
