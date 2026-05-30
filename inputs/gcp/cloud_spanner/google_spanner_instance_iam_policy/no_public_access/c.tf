data "google_iam_policy" "c" {
  binding {
    role    = "roles/spanner.viewer"
    members = ["user:legitimate-user@example.com"]
  }
}

resource "google_spanner_instance_iam_policy" "c" {
  instance    = "c"
  policy_data = data.google_iam_policy.c.policy_data
}
