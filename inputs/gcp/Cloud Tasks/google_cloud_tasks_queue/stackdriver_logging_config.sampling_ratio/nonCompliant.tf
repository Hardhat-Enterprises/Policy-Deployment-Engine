# Non-compliant stackdriver logging configuration

resource "google_cloud_tasks_queue" "non_compliant_example_1" {
  name     = "non_compliant_example_1"
  location = "us-central1"
  project  = "pde-project-vindya"

  stackdriver_logging_config {
    sampling_ratio = 0
  }
}
