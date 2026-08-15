resource "google_recaptcha_enterprise_key" "non_compliant_example_1" {
  project      = var.project
  display_name = "non_compliant_example_1"

  web_settings {
    integration_type = "POLICY_BASED_CHALLENGE"

    challenge_settings {
      default_settings {
        score_threshold = 0.2
      }
    }
  }
}