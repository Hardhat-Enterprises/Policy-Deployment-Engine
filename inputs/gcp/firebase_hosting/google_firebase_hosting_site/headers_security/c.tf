resource "google_firebase_project" "c_project" {
  project = "my-firebase-project"
}

resource "google_firebase_web_app" "c_app" {
  project      = google_firebase_project.c_project.project
  display_name = "My Secure Web App"
}

resource "google_firebase_hosting_site" "c_hosting_site" {
  project  = google_firebase_project.c_project.project
  site_id  = "my-secure-site"
  app_id   = google_firebase_web_app.c_app.app_id

  # Compliant: Security headers configured
  headers {
    key   = "X-Frame-Options"
    value = "DENY"
  }

  headers {
    key   = "Content-Security-Policy"
    value = "default-src 'self'; script-src 'self' 'unsafe-inline'"
  }
}