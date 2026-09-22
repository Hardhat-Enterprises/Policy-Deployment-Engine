# Compliant Cloud Tasks queue in an approved region

resource "google_cloud_tasks_queue" "compliant_example_1" {
  name     = "compliant_example_1"
  location = "australia-southeast1"
  project  = "pde-project-vindya"
}