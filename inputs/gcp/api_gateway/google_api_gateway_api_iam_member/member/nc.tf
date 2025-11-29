resource "google_api_gateway_api_iam_member" "nc" {
  provider = google-beta
  project  = "reliable-alpha-478205-k9"
  api      = "my-api-id-nc"
  role     = "roles/apigateway.viewer"
  member   = "allUsers"
}