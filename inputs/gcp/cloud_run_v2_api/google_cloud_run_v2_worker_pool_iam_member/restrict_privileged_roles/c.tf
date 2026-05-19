resource "google_cloud_run_v2_worker_pool_iam_member" "c" {
  project  = "my-project"
  location = "australia-southeast1"
  name     = "c"
  role     = "roles/viewer"
  member   = "user:jane@example.com"
}