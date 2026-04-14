resource "google_firebase_storage_bucket" "c" {
  provider  = google-beta
  project   = "83797152308"
  bucket_id = google_storage_bucket.c.name
}