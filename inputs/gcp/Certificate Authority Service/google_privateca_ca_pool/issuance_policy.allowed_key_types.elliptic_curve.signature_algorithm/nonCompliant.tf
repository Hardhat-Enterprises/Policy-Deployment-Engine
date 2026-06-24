resource "google_privateca_ca_pool" "non_compliant_example_1" {
  name     = "non_compliant_example_1"
  location = "us-central1"
  tier     = "ENTERPRISE"
  issuance_policy {
    allowed_key_types {
      elliptic_curve {
        signature_algorithm = "EDDSA_25519"
      }
    }
  }
}
