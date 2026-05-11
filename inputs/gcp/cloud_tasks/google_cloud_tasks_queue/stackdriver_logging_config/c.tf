# Compliant stackdriver logging configuration

resource "google_cloud_tasks_queue" "c" {
  name     = "logging-enabled-queue"
  location = "us-central1"

  stackdriver_logging_config {
    sampling_ratio = 0.8
  }
}