resource "google_privateca_certificate_template" "c" {
  name = "c"
  project = "PDE-Engine"
  location = "us-central1"
  description = "A sample certificate template"

  identity_constraints {
    allow_subject_alt_names_passthrough = false
    allow_subject_passthrough           = false
  }
}