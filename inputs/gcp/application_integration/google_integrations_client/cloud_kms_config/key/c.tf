resource "google_integrations_client" "c" {
  location = "us-east1"
  project = "c"
  cloud_kms_config {
    kms_location = "australia-southeast1"
    kms_ring = "keyring"
    key = "crypto_key"   # Approved key
  }
}