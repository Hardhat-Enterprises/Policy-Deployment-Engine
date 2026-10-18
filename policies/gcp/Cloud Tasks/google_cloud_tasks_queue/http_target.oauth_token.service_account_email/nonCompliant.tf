resource "google_cloud_tasks_queue" "non_compliant_example_1" {
  name     = "non_compliant_example_1"
  location = "us-central1"
  project  = "pde-project-vindya"

  http_target {
    oauth_token {
      service_account_email = "123456789-compute@developer.gserviceaccount.com"
    }
  }
}