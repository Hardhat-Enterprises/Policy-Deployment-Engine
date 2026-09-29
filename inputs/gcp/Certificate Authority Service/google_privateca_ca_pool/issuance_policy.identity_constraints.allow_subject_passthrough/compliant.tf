resource "google_privateca_ca_pool" "compliant_example_1" {
  name     = "compliant_example_1"
  location = "australia-southeast1"
  tier     = "ENTERPRISE"

  issuance_policy {
    identity_constraints {
      allow_subject_passthrough           = false
      allow_subject_alt_names_passthrough = false
    }
  }
}