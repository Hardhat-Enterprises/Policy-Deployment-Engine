# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant
resource "google_recaptcha_enterprise_key" "compliant_example_1" {
  project      = var.project
  display_name = "compliant_example_1"
  web_settings {
    integration_type              = "CHECKBOX"
    challenge_security_preference = "BALANCE"
  }
}

variable "project" {
  type = string
  default = "reliable-alpha-478205-k9"
}