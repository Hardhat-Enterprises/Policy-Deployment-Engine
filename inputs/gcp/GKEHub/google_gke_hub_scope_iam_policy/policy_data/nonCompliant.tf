data "google_iam_policy" "nc" {
  binding {
    role = "roles/gkehub.viewer"
    members = [
      "allUsers",
    ]
  }
}

resource "google_gke_hub_scope_iam_policy" "non_compliant_example_1" {
  project    = "example-project-123"
  scope_id   = "non_compliant_example_1"
  policy_data = data.google_iam_policy.nc.policy_data
}
