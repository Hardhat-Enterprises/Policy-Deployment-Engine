resource "google_storage_bucket" "image-store_c" {
  name     = "image-store-bucket-c"
  location = "EU"
}

resource "google_storage_bucket_iam_member" "c" {
  bucket = google_storage_bucket.image-store_c.name
  role = "roles/storage.admin"
  member = "group:admins@example.com"

}