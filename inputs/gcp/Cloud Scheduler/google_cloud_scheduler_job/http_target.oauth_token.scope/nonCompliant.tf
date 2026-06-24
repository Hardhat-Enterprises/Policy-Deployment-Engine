resource "google_cloud_scheduler_job" "non_compliant_example_1" {
  name        = "non_compliant_example_1"
  project     = "PDE"
  description = "test job"
  schedule    = "*/2 * * * *"
  region      = "australia-southeast1"

  
  http_target {
    http_method = "POST"
    uri         = "https://pubsub.googleapis.com/v1/projects/my-project-name/locations/australia-southeast1/jobs"

  oauth_token {
      service_account_email = "data.pde_service_account.default.email"
      scope = "https://www.googleapis.com/auth/cloud-platform"
    }
  }

}
