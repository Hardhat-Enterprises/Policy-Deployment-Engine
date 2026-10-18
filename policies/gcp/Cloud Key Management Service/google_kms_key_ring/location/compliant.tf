resource "google_kms_key_ring" "compliant_example_1" {
  name     = "compliant_example_1"
  location = "australia-southeast1"
  project  = "your-project-id"
}
