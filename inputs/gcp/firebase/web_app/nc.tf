# Non-compliant Firebase Web App without deletion protection
resource "google_firebase_web_app" "nc" {
  project         = "mock-project"
  display_name    = "non-compliant-web-app"
  deletion_policy = "DELETE"
}