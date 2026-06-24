resource "google_privateca_ca_pool" "c" {
  name     = "c"
  location = "us-central1"
  tier     = "ENTERPRISE"
}
