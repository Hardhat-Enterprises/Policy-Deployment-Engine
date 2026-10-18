resource "google_spanner_instance_iam_binding" "compliant_example_1" {
  instance = "compliant_example_1"
  role     = "roles/spanner.viewer"
  members  = ["user:legitimate-user@example.com"]
}
