resource "google_api_gateway_api_iam_binding" "c" {
  provider = google-beta
  project  = "reliable-alpha-478205-k9"
  api      = "c"
  role     = "roles/apigateway.viewer"
  members = [
    "user:jane@example.com",
  ]
}