# Google reCAPTCHA Enterprise Key (Web) - compliant (allow_amp_traffic=false)
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_recaptcha_enterprise_key" "c" {
  project      = var.project
  display_name = "recaptcha-web-compliant-allow-amp"

  web_settings {
    allow_all_domains = false
    allowed_domains   = ["example.com", "shop.example.com"]
    integration_type  = "SCORE"
    challenge_security_preference = "BALANCE"

    # Policy focus
    allow_amp_traffic = false
  }
}

# Inline declaration so you can pass -var on the CLI (no new files needed)
variable "project" { type = string }
