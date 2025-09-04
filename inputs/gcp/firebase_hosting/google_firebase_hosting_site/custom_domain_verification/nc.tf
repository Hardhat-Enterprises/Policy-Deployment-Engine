resource "google_firebase_project" "nc_project" {
  project = "my-firebase-project"
}

resource "google_firebase_web_app" "nc_app" {
  project      = google_firebase_project.nc_project.project
  display_name = "My Insecure Web App"
}

resource "google_firebase_hosting_site" "nc_hosting_site" {
  project  = google_firebase_project.nc_project.project
  site_id  = "my-insecure-site"
  app_id   = google_firebase_web_app.nc_app.app_id

  # Non-compliant: Invalid certificate preference
  custom_domain {
    domain_name = "insecure.example.com"
    cert_preference = "NONE"
  }

  custom_domain {
    domain_name = "bad.example.com"
    cert_preference = "INVALID_SETTING"
  }
}