resource "google_cloudbuildv2_connection" "nc" {
  project  = "nc"
  location = "us-central1"
  name     = "my-connection"

  github_config {
    app_installation_id = 123123
  }
}