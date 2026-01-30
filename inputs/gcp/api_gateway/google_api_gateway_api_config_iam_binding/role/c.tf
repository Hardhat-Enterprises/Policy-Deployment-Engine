resource "google_api_gateway_api_config_iam_binding" "c" {
  provider   = google-beta
  api        = "c"
  api_config = "c"
  role       = "roles/apigateway.viewer"
  members = [
    "user:jane@example.com",
  ]
}