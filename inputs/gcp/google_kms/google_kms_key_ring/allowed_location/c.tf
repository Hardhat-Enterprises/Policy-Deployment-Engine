resource "google_kms_key_ring" "c1" {
  name     = "c1"
  location = "australia-southeast1"
  project  = "your-project-id"
}
