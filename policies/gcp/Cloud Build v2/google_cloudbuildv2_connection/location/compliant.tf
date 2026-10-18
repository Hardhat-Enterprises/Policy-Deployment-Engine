resource "google_cloudbuildv2_connection" "compliant_example_1" {
  project  = "compliant_example_1"
  location = "australia-southeast2"
  name     = "compliant_example_1"

  github_config {
    app_installation_id = 123123
  }
}
