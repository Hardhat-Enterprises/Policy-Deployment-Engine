# Compliant IAM role configuration

resource "google_cloud_tasks_queue_iam_binding" "c" {
  name     = "c"
  location = "us-central1"
  role     = "roles/viewer"
  project  = "pde-project-vindya"

  members = [
    "user:test@example.com"
  ]
}