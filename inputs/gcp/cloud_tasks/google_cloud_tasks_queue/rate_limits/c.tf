# Compliant rate_limits

resource "google_cloud_tasks_queue" "c" {
  name     = "good-rate-queue"
  location = "us-central1"

  rate_limits {
    max_dispatches_per_second = 50
    max_concurrent_dispatches = 5
  }
}