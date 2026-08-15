resource "google_recaptcha_enterprise_key" "non_compliant_example_1" {
  project      = var.project
  display_name = "non_compliant_example_1"

  testing_options {
    testing_challenge = "NOCAPTCHA"
  }
}