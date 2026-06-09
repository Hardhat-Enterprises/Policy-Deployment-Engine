data "google_iam_policy" "nc" {
  binding {
    role = "roles/viewer"

    members = [
      "user:jane@example.com",
    ]
  }
}

resource "google_cloud_run_service_iam_policy" "nc" {
  location    = "australia-southeast1"
  project     = "wrong-project-id"
  service = "nc"
  policy_data = data.google_iam_policy.nc.policy_data
}
