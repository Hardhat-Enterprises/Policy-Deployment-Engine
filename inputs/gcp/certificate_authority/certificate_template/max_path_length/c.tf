resource "google_privateca_certificate_template" "c" {
  name = "c"
  project = "PDE-Engine"
  location = "us-central1"
  description = "A sample certificate template"

  predefined_values {
    ca_options {
      max_issuer_path_length = 4
    }
  }
}