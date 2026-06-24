
resource "google_cloud_scheduler_job" "c" {
  name        = "c"
  project     = "PDE"
  description = "test job"
  schedule    = "*/2 * * * *"
  region      = "australia-southeast1"

  app_engine_http_target {
    http_method = "GET"    

    app_engine_routing {
      service  = "my-service"                
      version  = "v1"                        
    }

    relative_uri = "/api/v1/resource"        
  }
}