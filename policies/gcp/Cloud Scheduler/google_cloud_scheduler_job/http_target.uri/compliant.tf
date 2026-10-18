resource "google_cloud_scheduler_job" "compliant_example_1" {
  name        = "compliant_example_1"
  project     = "PDE"
  description = "test job"
  schedule    = "*/2 * * * *"
  region      = "australia-southeast1"
  
  http_target {
      http_method = "POST"
      uri         = "https://example.com/"
      body        = base64encode("{\"foo\":\"bar\"}")
      headers = {
        "Content-Type" = "application/json"
      }
    }
  }
