resource "google_integrations_client" "nc1" {
  location = "us-east1"
  project = "nc1"

  cloud_kms_config {
    kms_location   = "us-east1"
    kms_ring       = "my-invalid-keyring"   # Correct key ring name
    key            = "my-key"
  }
}

resource "google_integrations_client" "nc2" {
  location = "us-east1"
  project = "nc2"

  cloud_kms_config {
    kms_location   = "us-east1"
    kms_ring       = ""   # Correct key ring name
    key            = "my-key"
  }
}