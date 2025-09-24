# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_recaptcha_enterprise_key" "nc" {
  project      = var.project
  display_name = "recaptcha-web-noncompliant"

  web_settings {
    allow_all_domains = true
    # Intentionally no allow-list when wildcarding
    integration_type  = "SCORE"
    challenge_security_preference = "BALANCE"
  }
}
