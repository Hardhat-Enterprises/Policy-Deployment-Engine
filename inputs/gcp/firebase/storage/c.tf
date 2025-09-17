# Compliant Firebase Storage bucket restricted to project members
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_storage_bucket" "c" {
  name     = "compliant-bucket-test"
  location = "US"
}

resource "google_storage_bucket_iam_member" "c" {
  bucket = google_storage_bucket.c.name
  role   = "roles/storage.objectViewer"
  member = "user:admin@example.com"
}



