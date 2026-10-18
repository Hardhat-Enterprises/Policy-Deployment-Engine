


resource "google_privateca_ca_pool" "non_compliant_example_1" {
  name     = "non_compliant_example_1"
  location = "australia-southeast1"
  tier     = "ENTERPRISE"

  issuance_policy {
    identity_constraints {
      allow_subject_passthrough           = false
      allow_subject_alt_names_passthrough = true
    }
  }
}