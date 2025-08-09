resource "google_storage_bucket" "nc" {
  name     = "noncompliant-bucket"
  location = "AU"
}

resource "google_storage_bucket_acl" "nc" {
  bucket      = google_storage_bucket.nc.name
  default_acl = "projectPrivate"
}
