resource "google_privateca_ca_pool" "compliant_example_1" {
  name     = "compliant_example_1"
  location = "us-central1"
  tier     = "ENTERPRISE"
}
