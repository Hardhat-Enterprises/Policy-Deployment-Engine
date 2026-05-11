# Non-compliant retry configuration

resource "google_cloud_tasks_queue" "nc" {
  name     = "insecure-retry-queue"
  location = "us-central1"
  project = "pde-project-vindya"

  retry_config {
    max_attempts       = -1
    max_retry_duration = "0s"
    max_backoff        = "3600s"
    min_backoff        = "0s"
    max_doublings      = 20
  }
}