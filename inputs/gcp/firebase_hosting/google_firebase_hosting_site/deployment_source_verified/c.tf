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

  # Compliant: Trusted CI/CD deployment source
  deployment_source {
    type = "GITHUB_ACTIONS"
    repository = "myorg/myrepo"
    branch = "main"
  }
}