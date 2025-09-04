resource "google_storage_bucket" "image-store_nc" {
  name     = "nc"
  location = "EU"
}
resource "google_storage_bucket_iam_member" "nc" {
  bucket = google_storage_bucket.image-store_nc.name
  role = "roles/storage.admin"
  member ="allUsers"
}