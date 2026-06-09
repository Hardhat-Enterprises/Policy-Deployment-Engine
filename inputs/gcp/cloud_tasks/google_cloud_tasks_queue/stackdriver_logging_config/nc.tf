# Non-compliant stackdriver logging configuration

resource "google_cloud_tasks_queue" "nc" {
  name     = "nc"
  location = "us-central1"
  project  = "pde-project-vindya"

  stackdriver_logging_config {
    sampling_ratio = 0
  }
}