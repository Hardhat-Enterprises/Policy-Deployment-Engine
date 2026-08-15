resource "google_recaptcha_enterprise_key" "compliant_example_1" {
  project      = var.project
  display_name = "compliant_example_1"

  android_settings {
    allow_all_package_names = false
    allowed_package_names   = ["com.companyname.appname"]
  }
}

variable "project" {
  type    = string
  default = "reliable-alpha-478205-k9"
}