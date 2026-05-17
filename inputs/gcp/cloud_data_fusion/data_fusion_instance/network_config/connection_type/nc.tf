resource "google_data_fusion_instance" "nc" {
  project          = "gcp-project-12345"
  name             = "nc"
  region           = "us-central1"
  type             = "BASIC"
  private_instance = true

  network_config {
    network       = "projects/hardhat-prod/global/networks/hardhat-vpc"
    ip_allocation = "10.1.0.0/22"
  }
}