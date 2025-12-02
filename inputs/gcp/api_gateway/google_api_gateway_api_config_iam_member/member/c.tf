resource "google_api_gateway_api_config_iam_member" "c" {
  provider   = google-beta
  api        = "c"
  api_config = "c"
  role       = "roles/apigateway.viewer"
  member     = "user:jane@example.com"
}