resource "google_api_gateway_api_config_iam_member" "c" {
  provider   = google-beta
  api        = "my-api-id-c"
  api_config = "my-api-config-id-c"
  role       = "roles/apigateway.viewer"
  member     = "user:jane@example.com"
}