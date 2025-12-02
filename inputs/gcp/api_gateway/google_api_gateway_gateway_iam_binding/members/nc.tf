resource "google_api_gateway_gateway_iam_binding" "nc" {
  provider = google-beta
  project  = "reliable-alpha-478205-k9"
  region   = "australia-southeast1"
  gateway  = "nc"
  role     = "roles/apigateway.viewer"
  members = [
    "allUsers",
  ]
}