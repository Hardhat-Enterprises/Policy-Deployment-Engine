resource "google_firebase_app_check_recaptcha_v3_config" "c" {
  app_id = "c"
  site_secret = "projects/my-project/secrets/my-secret"
}

resource "google_firebase_app_check_recaptcha_v3_config" "c2" {
  app_id = "c2"
  site_secret = "projects/another-project/secrets/another-secret"
}
