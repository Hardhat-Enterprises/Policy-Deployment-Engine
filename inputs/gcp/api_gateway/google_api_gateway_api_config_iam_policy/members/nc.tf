data "google_iam_policy" "nc" {
  provider = google-beta
  binding {
    role = "roles/apigateway.viewer"
    members = [
      "allUsers",
    ]
  }
}

resource "google_api_gateway_api_config_iam_policy" "nc" {
  provider    = google-beta
  api         = "my-api-id-nc"
  api_config  = "my-api-config-id-nc"
  policy_data = data.google_iam_policy.nc.policy_data
}