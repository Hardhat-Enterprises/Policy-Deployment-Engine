resource "google_recaptcha_enterprise_key" "compliant_example_1" {
  project      = var.project
  display_name = "compliant_example_1"

  web_settings {
    allow_all_domains = false
    allowed_domains    = ["example.com"]
    integration_type  = "SCORE"
    challenge_security_preference = "BALANCE"
  }

  deletion_policy = "PREVENT"
}

variable "project" {
  type    = string
  default = "reliable-alpha-478205-k9"
}