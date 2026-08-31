resource "google_cloudbuildv2_connection" "non_compliant_example_1" {
  project  = "non_compliant_example_1"
  location = "australia-southeast2"
  name     = "my-connection"
  disabled = false

  github_enterprise_config {
    host_uri                      = "https://ghe.example.com"
    private_key_secret_version    = "projects/my-project-nc/secrets/private-key/versions/1"
    webhook_secret_secret_version = "projects/my-project-nc/secrets/webhook-secret/versions/1"
    app_id                        = 200
    app_slug                      = "gcb-app"
    app_installation_id           = 300
  }
}
