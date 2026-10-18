resource "google_privateca_ca_pool" "compliant_example_1" {
  name     = "compliant_example_1"
  location = "australia-southeast1"
  tier     = "ENTERPRISE"

  issuance_policy {
    allowed_key_types {
      elliptic_curve {
        signature_algorithm = "ECDSA_P256"
      }
    }

    allowed_key_types {
      rsa {
        min_modulus_size = "3072"
        max_modulus_size = "4096"
      }
    }
  }
}