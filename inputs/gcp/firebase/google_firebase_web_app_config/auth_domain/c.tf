# This is for demonstrates a compliant case for the allowed domain policy only.
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_firebase_web_app" "c" {
  provider      = google-beta
  project       = "ankita-firebase-web-app"
  display_name  = "Firebase Web App C"
}

data "google_firebase_web_app_config" "c" {
  provider   = google-beta
  web_app_id = google_firebase_web_app.c.app_id
}

