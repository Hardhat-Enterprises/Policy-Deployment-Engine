resource "google_dataproc_job_iam_binding" "nc" {
  project = "my-project-dataproc02"
  region  = "us-central1"
  job_id  = "example-job-id"
  
  # VIOLATION: 'roles/viewer' is a primitive role.
  role    = "roles/viewer"
  
  members = [
    "user:test-user@example.com",
  ]
}