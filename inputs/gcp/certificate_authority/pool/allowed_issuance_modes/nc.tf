# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_privateca_ca_pool" "nc" {
    name = "nc"
    project = "PDE-project"
    location = "us-central1"
    tier = "ENTERPRISE"
    publishing_options {
        publish_ca_cert = true
        publish_crl = true
    }
    issuance_policy {
      allowed_issuance_modes {
        allow_config_based_issuance = false
        allow_csr_based_issuance = true
      }
      allowed_key_types {
        rsa {
          min_modulus_size = 1024
        }
      }
    }
}
