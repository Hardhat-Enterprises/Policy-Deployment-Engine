resource "google_data_fusion_instance" "nc" {
  project = "gcp-project-12345"
  name    = "nc"
  region  = "us-central1"
  type    = "BASIC"
  private_instance = true

  network_config {
    network       = "projects/hardhat-prod/global/networks/default"
    ip_allocation = "10.1.0.0/22"
  }

  crypto_key_config {
    key_reference = "projects/wrong-project/locations/us-central1/keyRings/hardhat-ring/cryptoKeys/cdf-key"
  }
}