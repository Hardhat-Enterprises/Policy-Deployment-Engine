resource "google_firebase_app_check_recaptcha_v3_config" "compliant_example_1" {
  app_id      = "compliant_example_1"
  site_secret = "projects/my-project/secrets/my-secret"
}

resource "google_firebase_app_check_recaptcha_v3_config" "compliant_example_2" {
  app_id      = "compliant_example_2"
  site_secret = "projects/another-project/secrets/another-secret"
}
