resource "google_api_gateway_api_config_iam_member" "nc" {
  provider   = google-beta
  api        = "nc"
  api_config = "nc"
  role       = "roles/apigateway.viewer"
  member     = "allUsers"
}