resource "google_api_gateway_gateway_iam_member" "nc" {
  provider = google-beta
  project  = "reliable-alpha-478205-k9"
  region   = "australia-southeast1"
  gateway  = "my-gateway-id-nc"
  role     = "roles/apigateway.admin"
  member   = "user:jane@example.com"
}