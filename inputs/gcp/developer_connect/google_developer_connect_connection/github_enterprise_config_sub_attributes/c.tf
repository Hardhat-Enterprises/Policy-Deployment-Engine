resource "google_developer_connect_connection" "c" {
  project       = "pde2025"
  location      = "australia-southeast1"
  connection_id = "c"

  github_enterprise_config {
    host_uri                      = "https://ghe.example.com"
    private_key_secret_version    = "projects/pde2025/secrets/ghe-private-key/versions/latest"
    webhook_secret_secret_version = "projects/pde2025/secrets/ghe-webhook/versions/latest"
  }
}
