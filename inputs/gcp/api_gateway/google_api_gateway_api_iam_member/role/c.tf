resource "google_api_gateway_api_iam_member" "c" {
  provider = google-beta
  project  = "reliable-alpha-478205-k9"
  api      = "my-api-id-c"
  role     = "roles/apigateway.viewer"
  member   = "user:jane@example.com"
}