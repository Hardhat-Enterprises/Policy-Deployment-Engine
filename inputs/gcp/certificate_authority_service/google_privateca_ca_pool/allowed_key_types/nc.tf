resource "google_privateca_ca_pool" "nc" {
  name     = "nc"
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
