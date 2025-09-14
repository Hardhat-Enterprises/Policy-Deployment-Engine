resource "google_developer_connect_connection" "nc" {
  project       = "pde2025"
  location      = "australia-southeast1"
  connection_id = "nc"

  github_config {
    github_app = "FIREBASE"
  }
}
