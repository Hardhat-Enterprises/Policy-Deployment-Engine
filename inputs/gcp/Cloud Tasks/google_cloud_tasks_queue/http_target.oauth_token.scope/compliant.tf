resource "google_cloud_tasks_queue" "compliant_example_1" {
  name     = "compliant_example_1"
  location = "us-central1"
  project  = "pde-project-vindya"

  http_target {
    oauth_token {
      service_account_email = "cloud-tasks@example.iam.gserviceaccount.com"
      scope                 = "https://www.googleapis.com/auth/devstorage.read_only"
    }
  }
}