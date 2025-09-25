resource "google_gke_hub_scope_iam_member" "c" {
  project  = "example-project-123"
  scope_id = "c"

  role   = "roles/gkehub.viewer"
  member = "user:name@org.com"
}
