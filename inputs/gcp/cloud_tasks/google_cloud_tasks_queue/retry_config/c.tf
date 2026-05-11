# Compliant retry configuration

resource "google_cloud_tasks_queue" "c" {
  name     = "secure-retry-queue"
  location = "us-central1"
  project = "pde-project-vindya"

  retry_config {
    max_attempts       = 5
    max_retry_duration = "60s"
    max_backoff        = "30s"
    min_backoff        = "5s"
    max_doublings      = 2
  }
}