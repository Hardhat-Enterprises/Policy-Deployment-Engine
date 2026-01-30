data "google_iam_policy" "nc" {
  provider = google-beta
  binding {
    role = "roles/owner"
    members = [
      "user:jane@example.com",
    ]
  }
}

resource "google_api_gateway_api_config_iam_policy" "nc" {
  provider    = google-beta
  api         = "nc"
  api_config  = "nc"
  policy_data = data.google_iam_policy.nc.policy_data
}