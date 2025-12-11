data "google_iam_policy" "nc1" {
  provider = google-beta
  binding {
    role = "roles/apigateway.viewer"
    members = [
      "allUsers",
    ]
  }
}

data "google_iam_policy" "nc2" {
  provider = google-beta
  binding {
    role = "roles/apigateway.admin"
    members = [
      "allAuthenticatedUsers",
    ]
  }
}

resource "google_api_gateway_api_config_iam_policy" "nc1" {
  provider    = google-beta
  api         = "nc1"
  api_config  = "nc1"
  policy_data = data.google_iam_policy.nc1.policy_data
}

resource "google_api_gateway_api_config_iam_policy" "nc2" {
  provider    = google-beta
  api         = "nc2"
  api_config  = "nc2"
  policy_data = data.google_iam_policy.nc2.policy_data
}