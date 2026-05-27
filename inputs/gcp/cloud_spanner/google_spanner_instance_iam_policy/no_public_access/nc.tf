data "google_iam_policy" "nc1" {
  binding {
    role    = "roles/spanner.viewer"
    members = ["allUsers"]
  }
}

resource "google_spanner_instance_iam_policy" "nc1" {
  instance    = "nc1"
  policy_data = data.google_iam_policy.nc1.policy_data
}
