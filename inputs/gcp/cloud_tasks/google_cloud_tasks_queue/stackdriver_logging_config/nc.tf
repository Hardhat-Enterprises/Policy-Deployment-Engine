# Non-compliant stackdriver logging configuration

resource "google_cloud_tasks_queue" "nc" {
  name     = "logging-disabled-queue"
  location = "us-central1"

  stackdriver_logging_config {
    sampling_ratio = 0
  }
}