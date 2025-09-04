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

  # Compliant: Proper cache control for sensitive content
  headers {
    source = "/login*"
    headers = {
      "Cache-Control" = "no-cache"
    }
  }

  # Compliant: Reasonable cache for static assets
  headers {
    source = "**/*.js"
    headers = {
      "Cache-Control" = "max-age=86400"
    }
  }
}