resource "google_api_gateway_api_config_iam_binding" "nc" {
  provider   = google-beta
  api        = "nc"
  api_config = "nc"
  role       = "roles/owner"
  members = [
    "user:jane@example.com",
  ]
}