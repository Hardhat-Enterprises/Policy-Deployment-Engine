# Non-compliant firebase web app configuration
# This is for demonstrating a non-compliant case for the allowed-domains policy.
# Keep "nc" as the name to indicate non-compliant attributes

resource "google_firebase_web_app" "c" {
  provider      = google-beta
  project       = "ankita-firebase-web-app"
  display_name  = "Firebase Web App C"
}

data "google_firebase_web_app_config" "c" {
  provider   = google-beta
  web_app_id = google_firebase_web_app.c.app_id
}