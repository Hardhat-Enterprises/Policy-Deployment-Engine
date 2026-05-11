# Compliant IAM role configuration

resource "google_cloud_tasks_queue_iam_binding" "c" {
  name     = "example-queue"
  location = "us-central1"
  role     = "roles/viewer"

  members = [
    "user:test@example.com"
  ]
}