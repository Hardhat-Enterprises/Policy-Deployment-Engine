resource "google_firebase_app_check_recaptcha_v3_config" "c" {
  app_id      = "projects/123456789/apps/your-firebase-app-id"
  site_secret = "restricted-api-key-12345"
}