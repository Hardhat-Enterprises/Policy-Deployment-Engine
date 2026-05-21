resource "google_data_fusion_instance" "c" {
  project = "gcp-project-12345"
  name    = "c"
  region  = "australia-southeast1"
  type    = "BASIC"
  private_instance = true

  network_config {
    network       = "projects/hardhat-prod/global/networks/default"
    ip_allocation = "10.1.0.0/22"
  }

  crypto_key_config {
    key_reference = "projects/hardhat-prod/locations/australia-southeast1/keyRings/hardhat-ring/cryptoKeys/cdf-key"
  }
}