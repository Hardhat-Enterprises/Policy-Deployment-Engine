resource "google_recaptcha_enterprise_key" "compliant_example_1" {
  project      = var.project
  display_name = "compliant_example_1"

  ios_settings {
    allow_all_bundle_ids = false
    allowed_bundle_ids    = ["com.companyname.productname.appname"]
  }
}

variable "project" {
  type    = string
  default = "reliable-alpha-478205-k9"
}