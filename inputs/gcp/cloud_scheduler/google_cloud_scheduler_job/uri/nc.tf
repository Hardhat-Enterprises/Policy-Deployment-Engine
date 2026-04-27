
resource "google_cloud_scheduler_job" "nc" {
  name        = "nc"
  project     = "PDE"
  description = "test job"
  schedule    = "*/2 * * * *"
  region      = "australia-southeast1"

  http_target {
    http_method = "POST"
    uri         = "http://example.com/"
    body        = base64encode("{\"foo\":\"bar\"}")
    headers = {
      "Content-Type" = "application/json"
    }
  }
}