resource "google_storage_bucket" "nc" {
  project                     = "83797152308"
  provider                    = google-beta
  name                        = "test_bucket_nc"
  location                    = "US"
  uniform_bucket_level_access = true
}

resource "google_firebase_storage_bucket" "nc" {
  provider  = google-beta
  project   = "83797152308"
  bucket_id = google_storage_bucket.nc.name
}