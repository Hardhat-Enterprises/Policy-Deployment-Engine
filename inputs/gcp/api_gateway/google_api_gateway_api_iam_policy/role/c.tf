data "google_iam_policy" "c" {
  provider = google-beta
  binding {
    role = "roles/apigateway.viewer"
    members = [
      "user:jane@example.com",
    ]
  }
}

resource "google_api_gateway_api_iam_policy" "c" {
  provider = google-beta
  project = "reliable-alpha-478205-k9"
  api = "my-api-id-c"
  policy_data = data.google_iam_policy.c.policy_data
}