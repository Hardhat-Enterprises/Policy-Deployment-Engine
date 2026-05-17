resource "google_cloud_run_v2_worker_pool_iam_member" "nc" {
  project  = "my-project"
  location = "australia-southeast1"
  name     = "nc"
  role     = "roles/admin"
  member   = "user:jane@example.com"
}