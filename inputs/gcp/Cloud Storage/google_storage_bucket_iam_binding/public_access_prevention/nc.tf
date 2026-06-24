resource "google_storage_bucket" "image-store_nc" {
  name     = "nc123"
  location = "EU"
}
resource "google_storage_bucket_iam_binding" "nc123" {
  bucket = google_storage_bucket.image-store_nc.name
  role   = "roles/storage.admin"
  members = [
    "allUsers",
  ]
}