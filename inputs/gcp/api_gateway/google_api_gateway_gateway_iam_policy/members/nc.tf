data "google_iam_policy" "nc1" {
  provider = google-beta
  binding {
    role = "roles/apigateway.viewer"
    members = [
      "allUsers",
    ]
  }
}

resource "google_api_gateway_gateway_iam_policy" "nc1" {
  provider    = google-beta
  project     = "reliable-alpha-478205-k9"
  region      = "australia-southeast1"
  gateway     = "nc1"
  policy_data = data.google_iam_policy.nc1.policy_data
}

data "google_iam_policy" "nc2" {
  provider = google-beta
  binding {
    role = "roles/owner"
    members = [
      "allAuthenticatedUsers",
    ]
  }
}

resource "google_api_gateway_gateway_iam_policy" "nc2" {
  provider    = google-beta
  project     = "reliable-alpha-478205-k9"
  region      = "australia-southeast1"
  gateway     = "nc2"
  policy_data = data.google_iam_policy.nc2.policy_data
}