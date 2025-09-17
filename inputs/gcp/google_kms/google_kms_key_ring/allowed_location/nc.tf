resource "google_kms_key_ring" "nc1" {
  name     = "nc1"
  location = "europe-west1"
  project  = "your-project-id"
}


