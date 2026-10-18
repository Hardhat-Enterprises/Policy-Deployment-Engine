resource "google_spanner_instance_iam_member" "compliant_example_1" {
  instance = "compliant_example_1"
  role     = "roles/spanner.viewer"
  member   = "user:legitimate-user@example.com"
}
