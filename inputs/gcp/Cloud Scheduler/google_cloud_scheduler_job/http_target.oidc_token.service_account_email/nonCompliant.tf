resource "google_cloud_scheduler_job" "non_compliant_example_1" {
  name        = "non_compliant_example_1"
  project     = "PDE"
  description = "test job"
  schedule    = "*/2 * * * *"
  region      = "australia-southeast1"

  
  http_target {
    http_method = "GET"
    uri         = "https://my-service.australia-southeast1.run.app/process"

    oidc_token {
      service_account_email = ""
    }
    }
}
  

