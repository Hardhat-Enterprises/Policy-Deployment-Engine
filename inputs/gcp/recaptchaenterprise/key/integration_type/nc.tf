# Google reCAPTCHA Enterprise Key (Web) — non-compliant (integration_type != "SCORE")
resource "google_recaptcha_enterprise_key" "nc" {
  project      = var.project
  display_name = "nc"

  web_settings {
    allow_all_domains = false
    allowed_domains   = ["example.com", "shop.example.com"]

    # policy focus (intentionally wrong)
    integration_type = "CHECKBOX"

    # keep neutral so this folder only fails on integration_type
    challenge_security_preference = "BALANCE"
  }
}
