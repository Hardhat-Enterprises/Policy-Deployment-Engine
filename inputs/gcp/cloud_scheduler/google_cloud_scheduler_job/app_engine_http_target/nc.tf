
resource "google_cloud_scheduler_job" "nc" {
  name        = "nc"
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

    relative_uri = "/api/v1/resource"        
  }
}