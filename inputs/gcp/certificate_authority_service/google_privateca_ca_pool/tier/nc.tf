resource "google_privateca_ca_pool" "nc" {
  name     = "nc"
  location = "us-central1"
  tier     = "DEVOPS"
}
