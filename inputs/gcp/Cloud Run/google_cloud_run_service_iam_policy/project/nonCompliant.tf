data "google_iam_policy" "nc" {
  binding {
    role = "roles/viewer"

    members = [
      "user:jane@example.com",
    ]
  }
}

resource "google_cloud_run_service_iam_policy" "non_compliant_example_1" {
  location    = "australia-southeast1"
  project     = "wrong-project-id"
  service = "non_compliant_example_1"
  policy_data = data.google_iam_policy.nc.policy_data
}
