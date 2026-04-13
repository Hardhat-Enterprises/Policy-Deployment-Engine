# Google reCAPTCHA Enterprise Key (Web) - non-compliant (allow_amp_traffic=true)
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_recaptcha_enterprise_key" "nc" {
  project      = var.project
  display_name = "nc"

  web_settings {
    # Keep wildcarding off so the failure is only about AMP
    allow_all_domains             = false
    allowed_domains               = ["example.com", "shop.example.com"]
    integration_type              = "SCORE"
    challenge_security_preference = "BALANCE"

    # Policy focus
    allow_amp_traffic = true
  }
}
