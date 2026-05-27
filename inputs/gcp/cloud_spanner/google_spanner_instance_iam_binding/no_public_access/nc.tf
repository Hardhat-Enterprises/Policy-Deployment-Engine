resource "google_spanner_instance_iam_binding" "nc1" {
  instance = "nc1-instance"
  role     = "roles/spanner.viewer"
  members  = ["allUsers"]
}
