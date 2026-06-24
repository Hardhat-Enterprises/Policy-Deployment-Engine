resource "google_cloud_run_v2_service_iam_member" "non_compliant_example_1" {
  project  = "my-project"
  location = "australia-southeast1"
  name     = "non_compliant_example_1"
  role     = "roles/viewer"
  member   = "allUsers"
}
