resource "google_firebase_storage_bucket" "nc" {
  provider  = google-beta
  project   = "83797152308"
  bucket_id = google_storage_bucket.nc.name
}