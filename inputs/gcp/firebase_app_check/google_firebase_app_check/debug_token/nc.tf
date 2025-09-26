
resource "google_firebase_app_check_debug_token" "nc" {
  display_name = ""  # Empty → non-compliant
  token        = "random_uuid.debug_token.result"
  app_id       = "projects/my-project/apps/my-app"
}
