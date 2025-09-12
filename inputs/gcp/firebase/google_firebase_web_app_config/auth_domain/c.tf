# This is for demonstrates a compliant case for the allowed domain policy only.
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_firebase_web_app" "c" {
  provider     = google-beta
  display_name  = "Firebase Web App C"
  project       = "ankita-firebase-web-app"
}

data "google_firebase_web_app_config" "c" {
  provider     = google-beta
  project    = google_firebase_web_app.c.project
  web_app_id = google_firebase_web_app.c.app_id
}

  output "firebase_auth_domain_c" {
    value = data.google_firebase_web_app_config.c.auth_domain
  }
