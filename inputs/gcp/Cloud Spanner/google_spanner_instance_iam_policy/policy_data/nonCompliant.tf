data "google_iam_policy" "nc" {
  binding {
    role    = "roles/spanner.viewer"
    members = ["allUsers"]
  }
}

resource "google_spanner_instance_iam_policy" "non_compliant_example_1" {
  instance    = "non_compliant_example_1"
  policy_data = data.google_iam_policy.nc.policy_data
}
