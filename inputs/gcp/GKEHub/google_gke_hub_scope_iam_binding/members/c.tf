resource "google_gke_hub_scope_iam_binding" "c" {
  project  = "example-project-123"
  scope_id = "c"

  role    = "roles/gkehub.viewer"
  members = [
    "group:user@organisation.com",
  ]
}
