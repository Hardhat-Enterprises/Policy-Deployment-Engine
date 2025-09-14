resource "google_developer_connect_connection" "c" {
  project       = "pde2025"
  location      = "australia-southeast1"
  connection_id = "c"

  github_enterprise_config {
    host_uri = "https://ghe.example.com"
  }
}
