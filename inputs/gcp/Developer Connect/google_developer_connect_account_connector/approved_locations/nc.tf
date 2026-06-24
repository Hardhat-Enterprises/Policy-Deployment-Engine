resource "google_developer_connect_account_connector" "nc" {
  project = "pde2025"
  location = "us-central1"
  account_connector_id = "nc"

  provider_oauth_config {
    scopes = ["repo"]
  }
}