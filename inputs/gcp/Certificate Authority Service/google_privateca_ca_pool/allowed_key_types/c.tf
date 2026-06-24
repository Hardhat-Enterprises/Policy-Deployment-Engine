resource "google_privateca_ca_pool" "c" {
  name     = "c"
  location = "us-central1"
  tier     = "ENTERPRISE"
  issuance_policy {
    allowed_key_types {
      elliptic_curve {
        signature_algorithm = "ECDSA_P256"
      }
    }
  }
}
