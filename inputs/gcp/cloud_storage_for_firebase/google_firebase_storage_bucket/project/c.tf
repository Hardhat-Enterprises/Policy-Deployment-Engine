resource "google_storage_bucket" "c" {
  project                     = "83797152308"
  provider                    = google-beta
  name                        = "test_bucket"
  location                    = "US"
  uniform_bucket_level_access = true
}

resource "google_firebase_storage_bucket" "c" {
  provider  = google-beta
  project   = "83797152308"
  bucket_id = google_storage_bucket.c.name
}