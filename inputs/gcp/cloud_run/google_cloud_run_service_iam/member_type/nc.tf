data "google_iam_policy" "nc" {
  binding {
    role = "roles/viewer"

    members = [
      "domain:example.com",
    ]
  }
}

resource "google_cloud_run_service_iam_policy" "nc" {
  location    = "australia-southeast1"
  project     = "my-gcp-project"
  service     = "cloudrun-srv"
  policy_data = data.google_iam_policy.nc.policy_data
}