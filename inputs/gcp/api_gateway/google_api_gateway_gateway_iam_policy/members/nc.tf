data "google_iam_policy" "nc" {
  provider = google-beta
  binding {
    role = "roles/apigateway.viewer"
    members = [
      "allUsers",
    ]
  }
}

resource "google_api_gateway_gateway_iam_policy" "nc" {
  provider    = google-beta
  project     = "reliable-alpha-478205-k9"
  region      = "australia-southeast1"
  gateway     = "my-gateway-id-nc"
  policy_data = data.google_iam_policy.nc.policy_data
}