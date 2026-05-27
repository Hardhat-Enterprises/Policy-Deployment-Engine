data "google_iam_policy" "c1" {
  binding {
    role    = "roles/spanner.viewer"
    members = ["user:legitimate-user@example.com"]
  }
}

resource "google_spanner_instance_iam_policy" "c1" {
  instance    = "c1-instance"
  policy_data = data.google_iam_policy.c1.policy_data
}
