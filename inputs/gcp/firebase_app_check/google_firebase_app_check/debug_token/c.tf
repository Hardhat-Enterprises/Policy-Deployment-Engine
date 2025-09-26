
resource "google_firebase_app_check_debug_token" "c" {
  display_name = "compliant-debug-token"  # Non-empty → compliant
  token        = "random_uuid.debug_token.result"
  app_id       = "projects/my-project/apps/my-app"
}
