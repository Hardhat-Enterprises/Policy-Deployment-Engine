resource "google_kms_key_ring" "non_compliant_example_1" {
  name     = "non_compliant_example_1"
  location = "europe-west1"
  project  = "your-project-id"
}

