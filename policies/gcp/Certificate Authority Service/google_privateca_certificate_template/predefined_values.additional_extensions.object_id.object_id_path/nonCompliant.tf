resource "google_privateca_certificate_template" "non_compliant_example_1" {
  name            = "non-compliant-example-1"
  location        = "australia-southeast1"
  deletion_policy = "PREVENT"

  identity_constraints {
    allow_subject_passthrough           = false
    allow_subject_alt_names_passthrough = false
  }

  predefined_values {
    additional_extensions {
      object_id {
        object_id_path = [1, 3, 6, 1, 4, 1, 11129, 2, 5, 99999]
      }

      critical = true
      value    = "AQ=="
    }
  }
}