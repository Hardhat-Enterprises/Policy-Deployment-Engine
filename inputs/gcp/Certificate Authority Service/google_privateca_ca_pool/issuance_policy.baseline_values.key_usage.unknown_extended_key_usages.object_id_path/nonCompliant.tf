resource "google_privateca_ca_pool" "non_compliant_example_1" {
  name     = "non_compliant_example_1"
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

        unknown_extended_key_usages {
          object_id_path = [1, 3, 6, 1, 5, 5, 7, 3, 99]
        }
      }
    }
  }
}