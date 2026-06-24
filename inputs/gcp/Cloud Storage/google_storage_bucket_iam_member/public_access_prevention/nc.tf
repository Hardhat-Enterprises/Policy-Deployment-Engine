resource "google_storage_bucket" "image-store_nc" {
  name     = "nc123"
  location = "EU"
}
resource "google_storage_bucket_iam_member" "nc123" {
  bucket = google_storage_bucket.image-store_nc.name
  role   = "roles/storage.admin"
  member = "allUsers"
}