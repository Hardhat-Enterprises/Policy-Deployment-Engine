resource "google_dataproc_job_iam_binding" "c" {
  project = "my-project-dataproc02"
  region  = "us-central1"
  job_id  = "example-job-id"
  
  # Compliant: Grants a specific, appropriate role.
  role    = "roles/dataproc.viewer"
  
  members = [
    "user:test-user@example.com",
  ]
}