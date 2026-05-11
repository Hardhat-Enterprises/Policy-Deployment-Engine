# Non-compliant rate_limits

resource "google_cloud_tasks_queue" "nc" {
  name     = "bad-rate-queue"
  location = "us-central1"

  rate_limits {
    max_dispatches_per_second = 1000  # too high
    max_concurrent_dispatches = 100   # too high
  }
}