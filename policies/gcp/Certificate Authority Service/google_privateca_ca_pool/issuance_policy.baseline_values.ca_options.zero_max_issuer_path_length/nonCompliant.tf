resource "google_privateca_ca_pool" "non_compliant_example_1" {
  name     = "non_compliant_example_1"
  location = "australia-southeast1"
  tier     = "ENTERPRISE"

  issuance_policy {
    baseline_values {
      ca_options {
        is_ca                       = false
        zero_max_issuer_path_length = false
      }

      key_usage {
        base_key_usage {
          key_encipherment = false
        }

        extended_key_usage {
          server_auth = true
        }
      }
    }
  }
}