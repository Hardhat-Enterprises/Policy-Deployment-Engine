resource "google_spanner_database" "c1" {
  instance = "example-instance"
  name     = "c1"
  encryption_config {
    kms_key_name = "projects/fake-project/locations/us-central1/keyRings/fake-ring/cryptoKeys/fake-key"
  }
}
