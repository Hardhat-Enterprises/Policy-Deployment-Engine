resource "google_cloud_scheduler_job" "non_compliant_example_1" {
  name        = "non_compliant_example_1"
  project     = "PDE"
  description = "test job"
  schedule    = "*/2 * * * *"
  region      = "australia-southeast1"

  app_engine_http_target {
    http_method = "DELETE"                      

    app_engine_routing {
      service  = ""                
      version  = ""                        
    }

    relative_uri = "/password/fakeuri/api"        
  }
}
