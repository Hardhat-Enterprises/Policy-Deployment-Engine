resource "google_spanner_instance_iam_binding" "c" {
  instance = "c"
  role     = "roles/spanner.viewer"
  members  = ["user:legitimate-user@example.com"]
}
