resource "google_integrations_client" "nc" {
  location = "us-east1"
  project = "nc"
  cloud_kms_config {
    kms_location = "us-west1"
    kms_ring = "keyring"
    key = "key"
  }
}