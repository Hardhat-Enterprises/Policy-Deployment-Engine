resource "google_integrations_client" "nc1" {
  location = "us-east1"
  project = "nc1"
  cloud_kms_config {
    kms_location = "australia-southeast1"
    kms_ring = "keyring"
    key = "invalid_crypto_key" #Invalid key
  }
}

resource "google_integrations_client" "nc2" {
  location = "us-east1"
  project = "nc2"
  cloud_kms_config {
    kms_location = "australia-southeast1"
    kms_ring = "keyring"
    key = ""         #Empty key
  }
}