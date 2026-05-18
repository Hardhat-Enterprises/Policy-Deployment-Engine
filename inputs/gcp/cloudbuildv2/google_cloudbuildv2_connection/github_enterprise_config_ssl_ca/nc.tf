resource "google_cloudbuildv2_connection" "nc" {
  project  = "nc"
  location = "us-central1"
  name     = "my-connection"

  github_enterprise_config {
    host_uri                   = "https://ghe.example.com"
    ssl_ca                     = "unapproved-ca-cert"
    private_key_secret_version = "projects/my-project-nc/secrets/private-key/versions/1"
    app_id                     = 200
    app_slug                   = "gcb-app"
    app_installation_id        = 300
  }
}