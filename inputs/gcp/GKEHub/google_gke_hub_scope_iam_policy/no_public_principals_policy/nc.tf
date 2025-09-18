data "google_iam_policy" "nc" {
  binding {
    role = "roles/gkehub.viewer"
    members = [
      "allUsers",
    ]
  }
}

resource "google_gke_hub_scope_iam_policy" "nc" {
  project    = "example-project-123"
  scope_id   = "nc"
  policy_data = data.google_iam_policy.nc.policy_data
}
