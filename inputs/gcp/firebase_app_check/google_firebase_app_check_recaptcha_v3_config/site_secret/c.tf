resource "google_firebase_app_check_recaptcha_v3_config" "c" {
  app_id = "projects/my-project/apps/app1"
  site_secret = "projects/my-project/secrets/my-secret"
}

resource "google_firebase_app_check_recaptcha_v3_config" "c2" {
  app_id = "projects/another-project/apps/app2"
  site_secret = "projects/another-project/secrets/another-secret"
}
