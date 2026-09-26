# Non-compliant Cloud Tasks queue outside the approved regions

resource "google_cloud_tasks_queue" "non_compliant_example_1" {
  name     = "non_compliant_example_1"
  location = "us-central1"
  project  = "pde-project-vindya"
}