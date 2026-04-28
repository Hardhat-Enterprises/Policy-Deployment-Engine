resource "google_cloudbuildv2_connection" "c" {
  project  = "c"
  location = "australia-southeast2"
  name     = "my-connection"

  github_enterprise_config {
    host_uri                      = "https://ghe.example.com"
    app_id                        = 200
    app_slug                      = "gcb-app"
    app_installation_id           = 300
    private_key_secret_version    = "projects/my-project-c/secrets/private-key/versions/1"
    webhook_secret_secret_version = "projects/my-project-c/secrets/webhook-secret/versions/1"

    service_directory_config {
      service = "projects/my-project-c/locations/australia-southeast2/namespaces/my-namespace/services/my-service"
    }
  }
}