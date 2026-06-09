resource "google_spanner_instance_iam_member" "c" {
  instance = "c"
  role     = "roles/spanner.viewer"
  member   = "user:legitimate-user@example.com"
}
