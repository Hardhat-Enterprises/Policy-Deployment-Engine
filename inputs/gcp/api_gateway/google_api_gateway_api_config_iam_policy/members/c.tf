data "google_iam_policy" "c" {
  provider = google-beta
  binding {
    role = "roles/apigateway.viewer"
    members = [
      "user:jane@example.com",
    ]
  }
}

resource "google_api_gateway_api_config_iam_policy" "c" {
  provider    = google-beta
  api         = "my-api-id-c"
  api_config  = "my-api-config-id-c"
  policy_data = data.google_iam_policy.c.policy_data
}