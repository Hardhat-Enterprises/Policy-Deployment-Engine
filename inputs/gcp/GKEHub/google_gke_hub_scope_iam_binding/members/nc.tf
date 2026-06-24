resource "google_gke_hub_scope_iam_binding" "nc" {
  project  = "example-project-123"
  scope_id = "nc"

  role    = "roles/gkehub.viewer"
  members = [
    "allUsers",
  ]
}
