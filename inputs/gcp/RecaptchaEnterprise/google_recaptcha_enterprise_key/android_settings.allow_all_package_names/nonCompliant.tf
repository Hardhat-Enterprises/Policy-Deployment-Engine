resource "google_recaptcha_enterprise_key" "non_compliant_example_1" {
  project      = var.project
  display_name = "non_compliant_example_1"

  android_settings {
    allow_all_package_names = true
  }
}