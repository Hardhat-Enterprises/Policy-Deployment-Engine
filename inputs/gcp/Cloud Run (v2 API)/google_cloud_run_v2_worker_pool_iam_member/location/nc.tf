resource "google_cloud_run_v2_worker_pool_iam_member" "nc" {
  project  = "my-project"
  location = "us-east1"
  name     = "nc"
  role     = "roles/viewer"
  member   = "user:jane@example.com"
}