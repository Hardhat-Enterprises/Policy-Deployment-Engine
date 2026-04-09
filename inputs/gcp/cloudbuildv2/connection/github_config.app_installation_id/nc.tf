resource "google_cloudbuildv2_connection" "nc" {
  project  = "my-project-nc"
  location = "us-central1"
  name     = "my-connection"

  github_config {
    app_installation_id = 999
  }
}