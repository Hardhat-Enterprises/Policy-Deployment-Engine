resource "google_spanner_instance_iam_binding" "nc" {
  instance = "nc"
  role     = "roles/spanner.viewer"
  members  = ["allUsers"]
}
