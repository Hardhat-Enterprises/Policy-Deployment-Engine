# Non-compliant rate_limits

resource "google_cloud_tasks_queue" "nc" {
  name     = "nc"
  location = "us-central1"
  project  = "pde-project-vindya"

  rate_limits {
    max_dispatches_per_second = 1000
    max_concurrent_dispatches = 100
  }
}