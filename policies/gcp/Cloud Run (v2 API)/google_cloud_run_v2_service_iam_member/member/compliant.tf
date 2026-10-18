resource "google_cloud_run_v2_service_iam_member" "compliant_example_1" {
  project  = "my-project"
  location = "australia-southeast1"
  name     = "compliant_example_1"
  role     = "roles/viewer"
  member   = "user:jane@example.com"
}
