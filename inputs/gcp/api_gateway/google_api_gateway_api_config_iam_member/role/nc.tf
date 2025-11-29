resource "google_api_gateway_api_config_iam_member" "nc" {
  provider = google-beta
  api = "my-api-id-nc"
  api_config = "my-api-config-id-nc"
  role = "roles/owner"
  member = "user:jane@example.com"
}