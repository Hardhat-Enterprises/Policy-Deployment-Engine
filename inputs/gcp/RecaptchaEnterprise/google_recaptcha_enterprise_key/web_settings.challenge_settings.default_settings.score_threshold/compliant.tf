resource "google_recaptcha_enterprise_key" "compliant_example_1" {
  project      = var.project
  display_name = "compliant_example_1"

  web_settings {
    integration_type = "POLICY_BASED_CHALLENGE"

    challenge_settings {
      default_settings {
        score_threshold = 0.7
      }
    }
  }
}

variable "project" {
  type    = string
  default = "reliable-alpha-478205-k9"
}