# Non-compliant rate_limits

resource "google_cloud_tasks_queue" "nc" {
  name     = "nc"
  location = "us-central1"
  project  = "pde-project-vindya"
}