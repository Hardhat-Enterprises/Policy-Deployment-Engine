# Non-compliant Firebase Storage bucket allowing public access
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_storage_bucket" "nc" {
  name     = "noncompliant-bucket-test"
  location = "US"
}

resource "google_storage_bucket_iam_member" "nc" {
  bucket = google_storage_bucket.nc.name
  role   = "roles/storage.objectViewer"
  member = "allUsers"
}



