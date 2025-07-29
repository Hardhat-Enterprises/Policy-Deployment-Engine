resource "google_storage_bucket" "image-store_c" {
  name     = "image-store-bucket-c"
  location = "EU"
}

resource "google_storage_bucket_iam_binding" "c" {
  bucket = google_storage_bucket.image-store_c.name
  role = "roles/storage.admin"
  members = [
    "user:jane@example.com",
  ]
}