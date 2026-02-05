resource "google_app_engine_application" "c" {
  project     = "my-project"
  location_id = "us-central"

  iap {
    oauth2_client_id     = "12345.apps.googleusercontent.com"
    oauth2_client_secret = "secret-value"
  }
}