resource "google_integrations_client" "c" {
  location = "us-east1"
  project = "c"

  cloud_kms_config {
    kms_location   = "us-east1"
    kms_ring       = "my-keyring"   # Correct key ring name
    key            = "my-key"
  }
}
