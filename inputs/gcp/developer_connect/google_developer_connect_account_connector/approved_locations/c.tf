resource "google_developer_connect_account_connector" "c" {
  project = "pde2025"
  location = "australia-southeast1"
  account_connector_id = "c"

  provider_oauth_config {
    scopes = ["repo"]
  }
}