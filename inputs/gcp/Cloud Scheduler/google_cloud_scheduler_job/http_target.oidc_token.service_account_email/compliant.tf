resource "google_cloud_scheduler_job" "compliant_example_1" {
  name        = "compliant_example_1"
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
