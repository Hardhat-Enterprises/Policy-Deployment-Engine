data "google_iam_policy" "c" {
  binding {
    role = "roles/gkehub.viewer"
    members = [
      "group:sec-readers@example.com",
    ]
  }
}

resource "google_gke_hub_scope_iam_policy" "c" {
  project    = "example-project-123"
  scope_id   = "c"
  policy_data = data.google_iam_policy.c.policy_data
}
