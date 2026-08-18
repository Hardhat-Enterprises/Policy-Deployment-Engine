data "google_iam_policy" "c" {
  binding {
    role    = "roles/spanner.viewer"
    members = ["user:legitimate-user@example.com"]
  }
}

resource "google_spanner_instance_iam_policy" "compliant_example_1" {
  instance    = "compliant_example_1"
  policy_data = data.google_iam_policy.c.policy_data
}
