
resource "google_cloud_scheduler_job" "c" {
  name        = "c"
  project     = "PDE"
  description = "test job"
  schedule    = "*/2 * * * *"
  region      = "australia-southeast1"

  
  http_target {
    http_method = "POST"
    uri         = "https://my-service.australia-southeast1.run.app/process"

  oidc_token {
      service_account_email = "c_scheduler@pde.iam.gserviceaccount.com"
    }
  }

}