resource "google_gke_hub_scope_iam_member" "non_compliant_example_1" {
  project  = "example-project-123"
  scope_id = "non_compliant_example_1"

  role   = "roles/gkehub.editor"
  member = "allAuthenticatedUsers"
}
