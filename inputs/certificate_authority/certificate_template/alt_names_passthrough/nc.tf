resource "google_privateca_certificate_template" "nc" {
  name = "nc"
  project = "PDE-Engine"
  location = "us-central1"
  description = "A sample certificate template"

  identity_constraints {
    allow_subject_alt_names_passthrough = true
    allow_subject_passthrough           = true
  }
}