resource "google_spanner_instance_iam_binding" "c1" {
  instance = "c1-instance"
  role     = "roles/spanner.viewer"
  members  = ["user:legitimate-user@example.com"]
}
