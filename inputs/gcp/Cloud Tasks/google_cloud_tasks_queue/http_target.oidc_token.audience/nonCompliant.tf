resource "google_cloud_tasks_queue" "non_compliant_example_1" {
  name     = "non_compliant_example_1"
  location = "us-central1"
  project  = "pde-project-vindya"

  http_target {
    oidc_token {
      service_account_email = "cloud-tasks@pde-project-vindya.iam.gserviceaccount.com"
      audience              = ""
    }
  }
}