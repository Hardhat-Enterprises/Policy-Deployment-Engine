# Compliant Cloud Tasks queue protected from Terraform-driven deletion

resource "google_cloud_tasks_queue" "compliant_example_1" {
  name     = "compliant_example_1"
  location = "us-central1"
  project  = "pde-project-vindya"

  deletion_policy = "PREVENT"
}