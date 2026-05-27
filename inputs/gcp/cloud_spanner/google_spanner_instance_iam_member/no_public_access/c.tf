resource "google_spanner_instance_iam_member" "c1" {
  instance = "c1-instance"
  role     = "roles/spanner.viewer"
  member   = "user:legitimate-user@example.com"
}
