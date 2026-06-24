
resource "google_cloud_scheduler_job" "c_g0" {
  name        = "c"
  project     = "PDE"
  description = "test job"
  schedule    = "*/2 * * * *"
  region      = "australia-southeast1"

  
  http_target {
    http_method = "POST"
    uri         = "https://example.com/ping"
    body        = base64encode("{\"foo\":\"bar\"}")
    headers = {
      "Content-Type" = "application/json"
    }
   }
}


resource "google_cloud_scheduler_job" "c_g1" {
  name        = "c"
  project     = "PDE"
  description = "test job"
  schedule    = "*/2 * * * *"
  region      = "australia-southeast1"

  
  http_target {
    http_method = "POST"
    uri         = "https://pubsub.googleapis.com/v1/projects/my-project-name/locations/australia-southeast1/jobs" 
  }
}
