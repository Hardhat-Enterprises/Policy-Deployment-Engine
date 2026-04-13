# Google reCAPTCHA Enterprise Key (Web) — compliant (integration_type = "SCORE")
resource "google_recaptcha_enterprise_key" "c" {
  project      = var.project
  display_name = "c"


  web_settings {
    allow_all_domains = false
    allowed_domains   = ["example.com", "shop.example.com"]

    # policy focus
    integration_type = "SCORE"

    # keep consistent posture with other tests
    challenge_security_preference = "BALANCE"
  }
}

# inline variable so you can pass -var from CLI
variable "project" {
  type    = string
  default = "reliable-alpha-478205-k9"
}
