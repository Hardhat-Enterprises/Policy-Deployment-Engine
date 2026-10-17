resource "google_privateca_ca_pool" "compliant_example_1" {
  name     = "compliant_example_1"
  location = "australia-southeast1"
  tier     = "ENTERPRISE"

  issuance_policy {
    baseline_values {
      ca_options {
        is_ca = false
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