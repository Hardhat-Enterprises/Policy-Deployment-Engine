resource "google_spanner_instance_iam_binding" "non_compliant_example_1" {
  instance = "non_compliant_example_1"
  role     = "roles/spanner.viewer"
  members  = ["allUsers"]
}
