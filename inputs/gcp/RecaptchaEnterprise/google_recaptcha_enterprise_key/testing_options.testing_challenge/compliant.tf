resource "google_recaptcha_enterprise_key" "compliant_example_1" {
  project      = var.project
  display_name = "compliant_example_1"

  testing_options {
    testing_challenge = "UNSOLVABLE_CHALLENGE"
  }
}

variable "project" {
  type    = string
  default = "reliable-alpha-478205-k9"
}