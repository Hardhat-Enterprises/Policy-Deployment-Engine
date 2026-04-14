resource "google_firebase_storage_bucket" "nc" {
  provider  = google-beta
  project   = "my-project-name"
  bucket_id = google_storage_bucket.nc.name
}