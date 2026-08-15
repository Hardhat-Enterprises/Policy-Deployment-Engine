resource "google_recaptcha_enterprise_key" "compliant_example_1" {
  project      = var.project
  display_name = "compliant_example_1"

  testing_options {
    testing_score = 0.5
  }
}

variable "project" {
  type    = string
  default = "reliable-alpha-478205-k9"
}