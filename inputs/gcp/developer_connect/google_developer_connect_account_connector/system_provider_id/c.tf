resource "google_developer_connect_account_connector" "c" {
  project = "pde2025"
  location = "australia-southeast1"
  account_connector_id = "tf-test-ac-c"

  provider_oauth_config {
    system_provider_id = "GITHUB"
    scopes = ["repo"]
  }
}