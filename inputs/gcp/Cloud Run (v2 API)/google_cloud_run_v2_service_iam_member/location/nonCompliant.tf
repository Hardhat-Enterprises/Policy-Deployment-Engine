resource "google_cloud_run_v2_service_iam_member" "non_compliant_example_1" {
  project  = "my-project"
  location = "us-east1"
  name     = "non_compliant_example_1"
  role     = "roles/viewer"
  member   = "user:jane@example.com"
}
