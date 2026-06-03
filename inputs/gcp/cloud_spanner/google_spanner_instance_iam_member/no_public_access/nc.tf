resource "google_spanner_instance_iam_member" "nc" {
  instance = "nc"
  role     = "roles/spanner.viewer"
  member   = "allUsers"
}
