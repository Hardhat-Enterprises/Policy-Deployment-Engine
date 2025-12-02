resource "google_api_gateway_gateway_iam_member" "c" {
  provider = google-beta
  project  = "reliable-alpha-478205-k9"
  region   = "australia-southeast1"
  gateway  = "c"
  role     = "roles/apigateway.viewer"
  member   = "user:jane@example.com"
}