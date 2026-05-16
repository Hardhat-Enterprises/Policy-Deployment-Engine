resource "google_cloud_run_v2_job_iam_member" "nc" {
  project  = "my-project"
  location = "australia-southeast1"
  name     = "nc"
  role     = "roles/viewer"
  member   = "allUsers"
}