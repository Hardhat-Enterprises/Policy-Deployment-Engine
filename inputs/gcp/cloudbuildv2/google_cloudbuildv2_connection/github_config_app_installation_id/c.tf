resource "google_cloudbuildv2_connection" "c" {
  project  = "c"
  location = "australia-southeast2"
  name     = "my-connection"

  github_config {
    app_installation_id = 300
  }
}