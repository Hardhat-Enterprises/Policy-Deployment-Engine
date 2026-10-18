resource "google_privateca_certificate_template" "compliant_example_1" {
  name            = "compliant-example-1"
  location        = "australia-southeast1"
  deletion_policy = "PREVENT"

  identity_constraints {
    allow_subject_passthrough           = false
    allow_subject_alt_names_passthrough = false
  }

  predefined_values {
    name_constraints {
      critical = true
    }
  }
}
