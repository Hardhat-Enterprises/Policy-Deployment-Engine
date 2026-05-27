resource "google_spanner_instance_iam_member" "nc1" {
  instance = "nc1"
  role     = "roles/spanner.viewer"
  member   = "allUsers"
}
