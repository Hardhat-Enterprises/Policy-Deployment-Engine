resource "google_cloudbuildv2_connection" "non_compliant_example_1" {
  project  = "non_compliant_example_1"
  location = "us-central1"
  name     = "my-connection"

  github_config {
    app_installation_id = 123123
  }
}
