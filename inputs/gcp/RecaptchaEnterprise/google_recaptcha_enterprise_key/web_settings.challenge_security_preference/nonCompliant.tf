# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant
resource "google_recaptcha_enterprise_key" "non_compliant_example_1" {
  project      = var.project
  display_name = "non_compliant_example_1"
  web_settings {
    integration_type              = "CHECKBOX"
    challenge_security_preference = "USABILITY"
  }
}