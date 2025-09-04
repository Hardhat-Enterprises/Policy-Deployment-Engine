resource "google_firebase_project" "c_project" {
  project = "my-firebase-project"
}

resource "google_firebase_web_app" "c_app" {
  project      = google_firebase_project.c_project.project
  display_name = "My Web App"
}

resource "google_firebase_hosting_site" "c_hosting_site" {
  project     = google_firebase_project.c_project.project
  site_id     = "my-site"
  app_id      = google_firebase_web_app.c_app.app_id

  # Compliant: Approved location
  location_id = "us-central1"
}