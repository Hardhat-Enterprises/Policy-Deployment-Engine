resource "google_recaptcha_enterprise_key" "non_compliant_example_1" {
  project      = var.project
  display_name = "non_compliant_example_1"

  web_settings {
    allow_all_domains = false
    allowed_domains    = ["example.com"]
    integration_type  = "SCORE"
    challenge_security_preference = "BALANCE"
  }

  deletion_policy = "DELETE"
}

resource "google_recaptcha_enterprise_key" "non_compliant_example_2" {
  project      = var.project
  display_name = "non_compliant_example_2"

  web_settings {
    allow_all_domains = false
    allowed_domains    = ["example.com"]
    integration_type  = "SCORE"
    challenge_security_preference = "BALANCE"
  }

  deletion_policy = "ABANDON"
}