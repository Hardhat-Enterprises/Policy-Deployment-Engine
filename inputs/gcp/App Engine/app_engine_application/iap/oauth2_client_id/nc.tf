resource "google_app_engine_application" "nc" {
  project     = "my-project"
  location_id = "us-central"

  iap {
    oauth2_client_id     = "incorrect-client-id.apps.googleusercontent.com"
    oauth2_client_secret = "secret-value"
  }
}