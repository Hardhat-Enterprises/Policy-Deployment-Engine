resource "google_developer_connect_connection" "nc" {
  project       = "pde2025"
  location      = "australia-southeast1"
  connection_id = "nc"

  github_enterprise_config {
    host_uri = "http://ghe.example.com"
  }
}
