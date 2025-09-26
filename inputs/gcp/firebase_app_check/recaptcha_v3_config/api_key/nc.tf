resource "google_firebase_app_check_recaptcha_v3_config" "nc" {
  app_id      = "projects/987654321/apps/your-firebase-app-id"
  site_secret = "restricted-api-key-12345"
}