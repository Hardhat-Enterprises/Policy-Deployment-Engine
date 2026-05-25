
resource "google_cloud_scheduler_job" "c" {
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