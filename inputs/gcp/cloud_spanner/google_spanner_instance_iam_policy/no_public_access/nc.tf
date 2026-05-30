data "google_iam_policy" "nc" {
  binding {
    role    = "roles/spanner.viewer"
    members = ["allUsers"]
  }
}

resource "google_spanner_instance_iam_policy" "nc" {
  instance    = "nc"
  policy_data = data.google_iam_policy.nc.policy_data
}
