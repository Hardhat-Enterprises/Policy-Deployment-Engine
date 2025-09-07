resource "google_developer_connect_account_connector" "nc" {
  project = "pde2025"
  location = "australia-southeast1"
  account_connector_id = "tf-test-ac-nc"

  provider_oauth_config {
    system_provider_id = "GITHUB"
    scopes = ["admin:org","repo"]
  }
}