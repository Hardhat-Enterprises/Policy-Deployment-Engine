data "google_iam_policy" "c" {
  binding {
    role = "roles/gkehub.viewer"
    members = [
      "group:sec-readers@example.com",
    ]
  }
}

resource "google_gke_hub_scope_iam_policy" "compliant_example_1" {
  project    = "example-project-123"
  scope_id   = "compliant_example_1"
  policy_data = data.google_iam_policy.c.policy_data
}
