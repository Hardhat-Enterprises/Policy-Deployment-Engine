resource "google_cloudbuild_bitbucket_server_config" "c" {
  config_id = "bbs-config"
  location  = "us-central1"
  host_uri  = "https://bbs.com"

  secrets {
    admin_access_token_version_name = "projects/myProject/secrets/adminpat/versions/1"
    read_access_token_version_name  = "projects/myProject/secrets/readpat/versions/1"
    webhook_secret_version_name     = "projects/myProject/secrets/webhooksecret/versions/1"
  }

  username = "ci-user"
  api_key  = "example-api-key"

  connected_repositories {
    project_key = "DEV"
    repo_slug   = "repo1"
  }
}
