# Non-compliant IAM public access configuration

resource "google_cloud_tasks_queue_iam_binding" "nc" {
  name     = "example-queue"
  location = "us-central1"
  role     = "roles/viewer"

  members = [
    "allUsers"
  ]
}