# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_recaptcha_enterprise_key" "c" {
  project      = var.project
  display_name = "c"

  web_settings {
    allow_all_domains = false
    allowed_domains   = ["example.com", "shop.example.com"]
    integration_type  = "SCORE"
    challenge_security_preference = "BALANCE"
  }
}
 
 variable "project" {
  type = string
  default = "reliable-alpha-478205-k9"
}
