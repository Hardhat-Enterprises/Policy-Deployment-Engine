resource "google_privateca_certificate_template" "non_compliant_example_1" {
  name            = "non-compliant-example-1"
  location        = "australia-southeast1"
  deletion_policy = "PREVENT"

  identity_constraints {
    allow_subject_passthrough           = true
    allow_subject_alt_names_passthrough = false
  }
}
