resource "google_cloudbuildv2_connection" "compliant_example_1" {
  project  = "compliant_example_1"
  location = "australia-southeast2"
  name     = "my-connection"

  bitbucket_cloud_config {
    workspace                     = "my-workspace"
    webhook_secret_secret_version = "projects/my-project-c/secrets/webhook-secret/versions/1"
    read_authorizer_credential {
      user_token_secret_version = "projects/my-project-c/secrets/read-token/versions/1"
    }
    authorizer_credential {
      user_token_secret_version = "projects/my-project-c/secrets/admin-token/versions/1"
    }
  }
}
