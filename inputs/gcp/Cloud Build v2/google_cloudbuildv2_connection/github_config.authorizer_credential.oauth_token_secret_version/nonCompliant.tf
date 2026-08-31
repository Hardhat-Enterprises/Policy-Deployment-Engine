resource "google_cloudbuildv2_connection" "non_compliant_example_1" {
  project  = "non_compliant_example_1"
  location = "australia-southeast2"
  name     = "my-connection"

  github_config {
    app_installation_id = 300

    authorizer_credential {
      oauth_token_secret_version = "projects/my-project-nc/secrets/wrong-secret/versions/1"
    }
  }
}
