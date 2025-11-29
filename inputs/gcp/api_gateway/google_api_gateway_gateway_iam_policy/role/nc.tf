data "google_iam_policy" "nc" {
  provider = google-beta
  binding {
    role = "roles/apigateway.admin"
    members = [
      "user:jane@example.com",
    ]
  }
}

resource "google_api_gateway_api_iam_policy" "nc" {
  provider = google-beta
  project = "reliable-alpha-478205-k9"
  api = "my-api-id-nc"
  policy_data = data.google_iam_policy.nc.policy_data
}