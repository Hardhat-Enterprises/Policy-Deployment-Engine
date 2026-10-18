resource "google_gke_hub_scope_iam_member" "compliant_example_1" {
  project  = "example-project-123"
  scope_id = "compliant_example_1"

  role   = "roles/gkehub.viewer"
  member = "user:name@org.com"
}
