resource "google_storage_bucket" "image-store_c" {
  name     = "c123"
  location = "EU"
}

resource "google_storage_bucket_iam_binding" "c123" {
  bucket = google_storage_bucket.image-store_c.name
  role   = "roles/storage.admin"
  members = [
    "user:jane@example.com",
  ]
}