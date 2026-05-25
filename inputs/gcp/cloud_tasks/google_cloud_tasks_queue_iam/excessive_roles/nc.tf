# Non-compliant IAM role configuration

resource "google_cloud_tasks_queue_iam_binding" "nc" {
  name     = "nc"
  location = "us-central1"
  role     = "roles/owner"
  project  = "pde-project-vindya"

  members = [
    "user:test@example.com"
  ]
}