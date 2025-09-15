# Compliant Firebase Web App with deletion protection
resource "google_firebase_web_app" "c" {
  project         = "mock-project"
  display_name    = "compliant-web-app"
  deletion_policy = "ABANDON"
}