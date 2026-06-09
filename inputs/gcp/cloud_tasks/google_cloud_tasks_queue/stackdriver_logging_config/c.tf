# Compliant stackdriver logging configuration

resource "google_cloud_tasks_queue" "c" {
  name     = "c"
  location = "us-central1"
  project  = "pde-project-vindya"

  stackdriver_logging_config {
    sampling_ratio = 0.8
  }
}