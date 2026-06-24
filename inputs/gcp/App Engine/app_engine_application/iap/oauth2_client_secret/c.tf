resource "google_app_engine_application" "c" {
  project     = "gcp-project-12345"
  location_id = "australia-southeast1"

  iap {
    oauth2_client_id     = "12345.apps.googleusercontent.com"
    oauth2_client_secret = "GOCSPX-abc123def456_actual_secret"
  }
}