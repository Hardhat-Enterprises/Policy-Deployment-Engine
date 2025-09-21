# Google reCAPTCHA Enterprise Key (Web) — compliant (integration_type = "SCORE")
resource "google_recaptcha_enterprise_key" "c" {
  project      = var.project
  display_name = "c1"
  web_settings {
    allow_all_domains = false
    allowed_domains   = ["example.com", "shop.example.com"]

    # policy focus
    integration_type  = "SCORE"

    # keep neutral so only integration_type is tested here
    challenge_security_preference = "BALANCE"
  }
}

# declare once per inputs folder so you can pass -var="project=..."
variable "project" { type = string }


