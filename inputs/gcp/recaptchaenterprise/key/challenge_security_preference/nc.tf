# Google reCAPTCHA Enterprise Key (Web) — non-compliant (integration_type != "SCORE")
resource "google_recaptcha_enterprise_key" "nc" {
  project      = var.project
  display_name = "recaptcha-web-noncompliant-challenge-security"


  web_settings {
    allow_all_domains = false
    allowed_domains   = ["example.com", "shop.example.com"]

    # policy focus (intentionally wrong)
    integration_type  = "SCORE"

    challenge_security_preference = "USABILITY"
  }
}
