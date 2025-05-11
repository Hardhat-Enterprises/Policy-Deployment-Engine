# Create a GCS bucket
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_storage_bucket" "nc" {
  name     = "noncompliant-bucket"
  location = "AU"
}

# Define ACL using default_acl (discouraged)
# Keep "nc" as the name to indicate non-compliance
resource "google_storage_bucket_acl" "nc" {
  bucket      = google_storage_bucket.nc.name
  default_acl = "projectPrivate"
}
