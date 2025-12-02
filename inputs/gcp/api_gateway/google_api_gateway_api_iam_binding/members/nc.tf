resource "google_api_gateway_api_iam_binding" "nc" {
  provider = google-beta
  project  = "reliable-alpha-478205-k9"
  api      = "nc"
  role     = "roles/apigateway.viewer"
  members = [
    "allUsers",
  ]
}